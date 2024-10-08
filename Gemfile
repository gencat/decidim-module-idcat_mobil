# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

# Declare your gem's dependencies in decidim-type.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

group :development, :test do
  gem "bootsnap"
  gem "byebug"
  gem "decidim"
  gem "decidim-dev"
  gem "faker"
  # Set versions because Property AutoCorrect errors.
  gem "rspec-rails", "~> 6.0.4"
  gem "rubocop-factory_bot", "2.25.1"
  gem "rubocop-rspec", "2.26.1"
  gem "social-share-button"
end

group :development do
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
end
