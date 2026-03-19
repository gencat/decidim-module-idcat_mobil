# frozen_string_literal: true

module Decidim
  module Valid
    class VerificationJob < ApplicationJob
      queue_as :default

      def perform(oauth_data)
        oauth_data = oauth_data.deep_symbolize_keys
        handler= retrieve_handler(oauth_data)
        authorization= Decidim::Authorization.find_by(name: "valid", unique_id: handler.unique_id)
        return if authorization&.granted?

        user= Decidim::User.find(oauth_data[:user_id])
        Decidim::Verifications::AuthorizeUser.call(handler, user.organization) do
          on(:ok) do
            Rails.logger.info("User #{user.id} verified successfully with VÀLid.")
            notify_user(handler.user, :ok, handler)
          end

          on(:invalid) do
            Rails.logger.error("Could not verify user #{user.id} with VÀLid: #{handler.errors.full_messages.join(", ")}")
            notify_user(user, :invalid, handler) if user
          end
        end
      end

      #-----------------------------------------------------------
      private

      #-----------------------------------------------------------

      # Retrieves handler from Verification workflows registry.
      def retrieve_handler(oauth_data)
        Decidim::AuthorizationHandler.handler_for("valid", oauth_data:)
      end

      def notify_user(user, status, handler)
        notification_class = status == :ok ? Decidim::IdcatMobil::VerificationSuccessNotification : Decidim::IdcatMobil::VerificationInvalidNotification
        Decidim::EventsManager.publish(
          event: "decidim.verifications.idcat_mobil.#{status}",
          event_class: notification_class,
          resource: user,
          affected_users: [user],
          extra: {
            status:,
            errors: handler.errors.full_messages
          }
        )
      end
    end
  end
end
