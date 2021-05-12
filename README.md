# Decidim::IdcatMobil

User registration and login through IdCat Mòbil, an authentication method that uses OAuth 2.0 protocol.
_IdCat mòbil_ is an identity validator from VÀLid (Validador d'Identitats del Consorci AOC).

User verification via IdCat Mòbil was started but is incomplete.

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

To use it you have to first configure the omniauth-idcat_mobil.

### omniauth-idcat_mobil configuration
`IdCat mòbil` will be available as a configurable OAuth2 strategy.
Check how to configure the strategy in [Decidim's related documentation](https://github.com/decidim/decidim/blob/develop/docs/services/social_providers.md). The summary is that you have to edit your `config/secrets.rb` and simply enable the strategy:

```yaml
  omniauth:
    idcat_mobil:
      enabled: true
      icon_path: decidim/idcat_mobil/icon.svg
```

Remember to set `IDCAT_MOBIL_CLIENT_ID`, `IDCAT_MOBIL_CLIENT_SECRET` and `IDCAT_MOBIL_SITE_URL` environment variables.


Refer to `omniauth-idcat_mobil` gem for further documentation.

## TODO

- User Verification development has to be finished.

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

This engine is distributed under the GNU AFFERO GENERAL PUBLIC LICENSE.

Authored by [CodiTramuntana](http://coditramuntana.com).

