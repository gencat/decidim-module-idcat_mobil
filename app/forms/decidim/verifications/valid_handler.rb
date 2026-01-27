# frozen_string_literal: true

module Decidim
  module Verifications
    # A Handler form object that just holds OAuth2 data provided by AOC when performing "VÀLid" authentication.
    class ValidHandler < AuthorizationHandler
      attribute :oauth_data, Hash

      validates :unique_id, presence: true
      validate :idcatmobil_method?, :has_ok_status?

      def unique_id
        oauth_data["identifier"]
      end

      def metadata
        oauth_data
      end

      def user
        Decidim::User.find_by(id: oauth_data[:user_id])
      end

      def to_partial_path
        "decidim/valid/verifications/form"
      end

      #-----------------------------------------------------------
      private

      #-----------------------------------------------------------

      def idcatmobil_method?
        return true if oauth_data["method"] == "idcatmobil"

        errors.add(:base, I18n.t("decidim.verifications.valid.errors.invalid_method"))
        false
      end

      def has_ok_status?
        return true if oauth_data["status"] == "ok"

        errors.add(:base, I18n.t("decidim.verifications.valid.errors.invalid_status"))
        false
      end
    end
  end
end
