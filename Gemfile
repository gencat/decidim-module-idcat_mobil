# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

# Declare your gem's dependencies in decidim-type.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# before going stable pull form master
gem 'omniauth-idcat_mobil', git: 'https://github.com/gencat/omniauth-idcat_mobil'

group :development, :test do
  gem "byebug", "~> 10.0", platform: :mri
  gem "bootsnap"
  gem "decidim", git: "https://github.com/decidim/decidim"
  gem "decidim-dev", git: "https://github.com/decidim/decidim"
  gem "social-share-button"
  gem "faker", "~> 1.9"
end

group :development do
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 3.5"
end
