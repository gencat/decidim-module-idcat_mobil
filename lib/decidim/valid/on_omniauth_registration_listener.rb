# frozen_string_literal: true

module Decidim
  module Valid
    #
    # Simply delegates the management of verifying IdCat mòbil to the VerificationJob.
    #
    class OnOmniauthRegistrationListener
      def self.on_omniauth_registration(oauth_data)
        VerificationJob.perform_later(oauth_data)
      end
    end
  end
end
