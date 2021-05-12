OmniAuth.config.logger= Rails.logger

if Rails.application.secrets.dig(:omniauth, :idcat_mobil).present?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider(
      :idcat_mobil,
      setup: ->(env) {
          request = Rack::Request.new(env)
          organization = Decidim::Organization.find_by(host: request.host)
          provider_config = organization.enabled_omniauth_providers[:idcat_mobil]
          env["omniauth.strategy"].options[:client_id] = provider_config[:client_id] || ENV["IDCAT_MOBIL_CLIENT_ID"]
          env["omniauth.strategy"].options[:client_secret] = provider_config[:client_secret] || ENV["IDCAT_MOBIL_CLIENT_SECRET"]
          env["omniauth.strategy"].options[:site] = provider_config[:site_url] || ENV["IDCAT_MOBIL_SITE_URL"]
        },
      scope: :autenticacio_usuari
    )
  end
end