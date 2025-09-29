# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "rubygems"
require "decidim/dev"
require "decidim/admin"
require "decidim/core"
require "decidim/core/test"

require "decidim/idcat_mobil"

ENV["ENGINE_NAME"] = File.dirname(__dir__).split("/").last
ENV["LANG"] = "en"

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
# Add additional requires below this line. Rails is not loaded until this point!

Decidim::Dev.dummy_app_path = File.expand_path(File.join(Dir.pwd, "spec", "decidim_dummy_app"))

require "decidim/dev/test/base_spec_helper"
