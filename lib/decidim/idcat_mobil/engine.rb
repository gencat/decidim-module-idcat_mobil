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

      initializer "decidim_idcat_mobil.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
