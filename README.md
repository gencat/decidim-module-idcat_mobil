# Decidim::IdcatMobil

User registration, login and verification through IdCat mòbil, an authentication method that uses OAuth 2.0 protocol.
_IdCat mòbil_ is an identity validator from VÀLid (Validador d'Identitats del Consorci AOC).

## Usage

To use it you have to first configure the omniauth-idcat_mobil and then this gem as a verification handler.

### omniauth-idcat_mobil configuration
 `IdCat mòbil` will be available as a configurable OAuth2 strategy.
IdcatMobil will be available as a configurable OAuth strategy.
To configure the strategy go to [Decidim's related documentation]().
Refer to `omniauth-idcat_mobil` gem for further documentation.

### Decidim Verifier configuration
This verifier is already configured through `decidim_verifications.rb` initializer in this engine.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-idcat_mobil'
```

And then execute:

```bash
bundle
```

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
