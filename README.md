# Decidim::IdcatMobil

User registration, login and verification through IdCat mòbil, an authentication method that uses OAuth 2.0 protocol.
_IdCat mòbil_ is an identity validator from VÀLid (Validador d'Identitats del Consorci AOC).

## Usage

IdcatMobil will be available as a configurable OAuth strategy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-idcat_mobil
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
