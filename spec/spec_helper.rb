# frozen_string_literal: true

require "decidim/dev"

ENV["ENGINE_NAME"] = File.dirname(__dir__).split("/").last
ENV["LANG"] = "en"

Decidim::Dev.dummy_app_path = File.expand_path(File.join(Dir.pwd, "spec", "decidim_dummy_app"))

require "decidim/dev/test/base_spec_helper"
