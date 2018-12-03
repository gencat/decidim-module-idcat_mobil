# frozen-string_literal: true

module Decidim
  module IdcatMobil
    class VerificationInvalidNotification < Decidim::Events::SimpleEvent
      def resource_path
        'http'
      end
      def resource_url
        'http'
      end
    end
  end
end
