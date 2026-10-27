# frozen_string_literal: true

require "rails"
require "decidim/core"
require "omniauth/idcat_mobil"

module Decidim
  module IdcatMobil
    # This is the engine that runs on the public interface of idcat_mobil.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::IdcatMobil

      routes do
        # Add engine routes here
        # resources :idcat_mobil
        # root to: "idcat_mobil#index"
      end

      # Since Decidim 0.31 OmniAuth providers are no longer read from secrets.yml,
      # they must be registered in `Decidim.omniauth_providers`. This registers
      # IdCat mòbil with defaults from ENV, unless the app already configured it.
      initializer "decidim_idcat_mobil.omniauth_provider", before: :load_config_initializers do
        Decidim.omniauth_providers[:idcat_mobil] ||= {
          enabled: ENV["IDCAT_MOBIL_CLIENT_ID"].present?,
          client_id: ENV.fetch("IDCAT_MOBIL_CLIENT_ID", nil),
          client_secret: ENV.fetch("IDCAT_MOBIL_CLIENT_SECRET", nil),
          site_url: ENV.fetch("IDCAT_MOBIL_SITE_URL", nil),
          icon_path: "media/images/idcat_mobil-icon.svg"
        }
      end

      initializer "decidim_valid.authorizations" do
        # Triggers user verification after login/registration
        ActiveSupport::Notifications.subscribe "decidim.user.omniauth_registration" do |_name, data|
          Decidim::Valid::OnOmniauthRegistrationListener.on_omniauth_registration(data)
        end
      end

      initializer "decidim_idcat_mobil.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
