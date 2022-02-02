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
  gem "decidim", ">= 0.24.0"
  gem "decidim-dev", ">= 0.24.0"
  gem "faker", "~> 1.9"
  gem "rubocop"
  gem "rubocop-rspec"
  gem "social-share-button"
end

group :development do
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
end
