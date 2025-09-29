# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :idcat_mobil_component, parent: :component do
    name { Decidim::Components::Namer.new(participatory_space.organization.available_locales, :idcat_mobil).i18n_name }
    manifest_name { :idcat_mobil }
    participatory_space { create(:participatory_process, :with_steps) }
  end

  # Add engine factories here
end
