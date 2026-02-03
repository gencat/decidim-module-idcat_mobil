# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

# Declare your gem's dependencies in decidim-type.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

require_relative "lib/decidim/idcat_mobil/version"
DECIDIM_IDCAT_MOBIL_DECIDIM_VERSION = "~> #{Decidim::IdcatMobil.decidim_version}".freeze

# concurrent-ruby v1.3.5 has removed the dependency on logger. Remove this line after upgrading rails to 7.1.
gem "concurrent-ruby", "1.3.4"
gem "omniauth-idcat_mobil", "~> 0.6.0"
gem "uri", "1.0.4"

group :development, :test do
  gem "bootsnap"
  gem "byebug"
  gem "decidim", DECIDIM_IDCAT_MOBIL_DECIDIM_VERSION
  gem "decidim-dev", DECIDIM_IDCAT_MOBIL_DECIDIM_VERSION
  gem "faker"
  gem "rspec-rails", "~> 6.0.4"
  gem "rubocop-factory_bot", "~> 2.26.1"
  gem "rubocop-rspec", "~> 3.0"
end

group :development do
  gem "letter_opener_web", "~> 3.0.0"
  gem "listen", "~> 3.9"
  gem "spring", "~> 4.0"
  gem "spring-watcher-listen", "~> 2.1"
  gem "web-console", "~> 4.2"
end
