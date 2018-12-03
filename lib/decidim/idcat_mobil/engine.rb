# frozen_string_literal: true

require "rails"
require "decidim/core"

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

      # initializer "decidim_idcat_mobil.assets" do |app|
      #   app.config.assets.precompile += %w[decidim_idcat_mobil_manifest.js decidim_idcat_mobil_manifest.css]
      # end
    end
  end
end
