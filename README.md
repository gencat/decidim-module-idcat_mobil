# Decidim::IdcatMobil

User registration, login and verification through IdCat mòbil, an authentication method that uses OAuth 2.0 protocol.
_IdCat mòbil_ is an identity validator from VÀLid (Validador d'Identitats del Consorci AOC).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-idcat_mobil'
```

And then execute:

```bash
bundle install
```

## Usage

To use it you have to first configure the omniauth-idcat_mobil and then this gem as a verification handler.

### omniauth-idcat_mobil configuration
`IdCat mòbil` will be available as a configurable OAuth2 strategy.
Check how to configure the strategy in [Decidim's related documentation](). The summary is that you have to edit your `config/secrets.rb` and simply enable the strategy:

```yaml
  omniauth:
    idcat_mobil:
      enabled: true
      icon_path: decidim/idcat_mobil/icon.svg
```

Omniauth's configuration is setted in `config/initializers/omniauth_idcat_mobil.rb`. Nothing has to be modified there but it expects `IDCAT_MOBIL_CLIENT_ID`, `IDCAT_MOBIL_CLIENT_SECRET` and `IDCAT_MOBIL_SITE_URL` environment variables to be setted.


Refer to `omniauth-idcat_mobil` gem for further documentation.

## Contributing

See [Decidim](https://github.com/decidim/decidim).

### Run tests

Create a dummy app in your application (if not present):

```bash
bin/rails decidim:generate_external_test_app
```

And run tests:

```bash
rspec spec
```

## License

This engine is distributed under the GNU AFFERO GENERAL PUBLIC LICENSE.

Authored by [CodiTramuntana](http://coditramuntana.com).

