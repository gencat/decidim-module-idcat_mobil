# frozen_string_literal: true

module Decidim
  module Verifications
    # A Handler form object that just holds OAuth2 data provided by AOC when performing "IdCat mòbil" authentication.
    class IdCatMobilHandler < AuthorizationHandler
      attribute :oauth_data, Hash

      validates :unique_id, presence: true
      validate :is_idcatmobil_method, :has_ok_status

      def unique_id
        oauth_data['identifier']
      end

      def metadata
       oauth_data
      end

      def user
        Decidim::User.find(oauth_data[:user_id])
      end

      #-----------------------------------------------------------
      private
      #-----------------------------------------------------------

      def is_idcatmobil_method
        return true if oauth_data['method'] == 'idcatmobil'
        errors.add(:base, I18n.t("decidim.verifications.idcat_mobil.errors.invalid_method"))
        false
      end
      def has_ok_status
        return true if oauth_data['status'] == 'ok'
        errors.add(:base, I18n.t("decidim.verifications.idcat_mobil.errors.invalid_status"))
        false
      end
    end
  end
end
