# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/idcat_mobil/version"
DECIDIM_IDCAT_MOBIL_DECIDIM_VERSION = ">= #{Decidim::IdcatMobil.decidim_version}".freeze

Gem::Specification.new do |s|
  s.version = Decidim::IdcatMobil.version
  s.authors = ["Oliver Valls"]
  s.email = ["oliver.vh@coditramuntana.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-idcat_mobil"
  s.required_ruby_version = ">= 3.3.4"

  s.name = "decidim-idcat_mobil"
  s.summary = "A decidim idcat_mobil module"
  s.description = "User registration, login and verification though VÀLid's IdCat mòbil.."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim", DECIDIM_IDCAT_MOBIL_DECIDIM_VERSION
  s.add_dependency "decidim-core", DECIDIM_IDCAT_MOBIL_DECIDIM_VERSION
  s.add_dependency "omniauth-idcat_mobil", "~> 0.6.0"
  s.metadata["rubygems_mfa_required"] = "true"
end
