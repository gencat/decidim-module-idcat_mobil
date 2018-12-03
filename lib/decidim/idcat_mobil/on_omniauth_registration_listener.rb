# frozen_string_literal: true

module Decidim
  module IdcatMobil
    #
    # Simply delegates the management of verifying IdCat mòbil to the VerificationJob.
    #
    class OnOmniauthRegistrationListener
      def on_omniauth_registration(oauth_data)
        VerificationJob.perform_later(oauth_data)
      end
    end
  end
end
