# Decidim::IdcatMobil

User registration and login through IdCat Mòbil, an authentication method that uses OAuth 2.0 protocol.
_IdCat mòbil_ is an identity validator from VÀLid (Validador d'Identitats del Consorci AOC).

User is also verified with a VÀLid authorization.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-idcat_mobil'
```

And then execute:

```bash
bundle install
```

Verifications by default will expire after 90 days but optionally you can set it to your needs by setting the `VERIFICATION_EXPIRATION_TIME` environment variable.

```bash
# change default value from 90 days to a whole year
VERIFICATION_EXPIRATION_TIME=365
```

## Usage

To use it you have to first configure the omniauth-idcat_mobil.

### omniauth-idcat_mobil configuration
`IdCat mòbil` will be available as a configurable OAuth2 strategy.
Check how social providers work in [Decidim's related documentation](https://docs.decidim.org/en/develop/services/social_providers).

Since Decidim 0.31, OmniAuth providers are no longer configured in `config/secrets.yml`. This module registers the `idcat_mobil` provider in `Decidim.omniauth_providers` automatically, so you only have to set these environment variables:

```bash
IDCAT_MOBIL_CLIENT_ID=your-client-id
IDCAT_MOBIL_CLIENT_SECRET=your-client-secret
IDCAT_MOBIL_SITE_URL=https://your-valid-site-url
```

The provider is enabled when `IDCAT_MOBIL_CLIENT_ID` is present. The credentials can also be set (or overridden) per organization from the system panel (`/system`).

If you need a custom configuration, define the provider in your app's `config/initializers/decidim.rb`. The module will not overwrite it:

```ruby
Decidim.configure do |config|
  config.omniauth_providers[:idcat_mobil] = {
    enabled: true,
    client_id: ENV.fetch("IDCAT_MOBIL_CLIENT_ID", nil),
    client_secret: ENV.fetch("IDCAT_MOBIL_CLIENT_SECRET", nil),
    site_url: ENV.fetch("IDCAT_MOBIL_SITE_URL", nil),
    icon_path: "media/images/idcat_mobil-icon.svg"
  }
end
```

Note: if your app replaces the whole hash (`config.omniauth_providers = { ... }`), you must include the `idcat_mobil` key there too, or the provider will be removed.


Refer to `omniauth-idcat_mobil` gem for further documentation.

## Contributing

See [Decidim](https://github.com/decidim/decidim).

### Run tests

Create a dummy app in your application (if not present):

```bash
bundle exec rake decidim:generate_external_test_app
```

And run tests:

```bash
bundle exec rspec spec/
```

## License


The Department d'Exteriors of [Generalitat de Catalunya](http://gencat.cat) makes this gem available as open source under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE.

Authored by [CodiTramuntana](http://coditramuntana.com).
