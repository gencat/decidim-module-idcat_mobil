# frozen_string_literal: true

OmniAuth.config.logger = Rails.logger

if Rails.application.secrets.dig(:omniauth, :idcat_mobil).present?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider(
      :idcat_mobil,
      setup: lambda { |env|
               request = Rack::Request.new(env)
               organization = Decidim::Organization.find_by(host: request.host)
               provider_config = organization.enabled_omniauth_providers[:idcat_mobil]
               env["omniauth.strategy"].options[:client_id] = provider_config[:client_id] || ENV.fetch("IDCAT_MOBIL_CLIENT_ID", nil)
               env["omniauth.strategy"].options[:client_secret] = provider_config[:client_secret] || ENV.fetch("IDCAT_MOBIL_CLIENT_SECRET", nil)
               env["omniauth.strategy"].options[:site] = provider_config[:site_url] || ENV.fetch("IDCAT_MOBIL_SITE_URL", nil)
             },
      scope: :autenticacio_usuari
    )
  end
end
