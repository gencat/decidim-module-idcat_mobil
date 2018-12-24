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
        resource :authorizations, only: [:new, :create, :edit, :update], as: :authorization

        root to: "authorizations#new"
      end

      initializer "idcat_mobil.add_authorization_handlers" do |_app|
        # Make IdCat mòbil OAuth2 handler accessible in the register:
        # ```
        # Decidim::AuthorizationHandler.handler_for(:idcat_mobil, ....)
        # ```
        # Decidim::Verifications.register_workflow(:idcat_mobil) do |workflow|
        #   workflow.form = "Decidim::Verifications::IdCatMobilHandler"
        # end
        # Make IdCat mòbil handler in User's profile accessible in the register:
        Decidim::Verifications.register_workflow(:idcat_mobil_profile) do |workflow|
          workflow.form = "Decidim::Verifications::IdCatMobilProfileHandler"
        end
      end

      # initializer "decidim_idcat_mobil.assets" do |app|
      #   app.config.assets.precompile += %w[decidim_idcat_mobil_manifest.js decidim_idcat_mobil_manifest.css]
      # end
    end
  end
end
