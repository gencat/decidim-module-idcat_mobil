# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :idcat_mobil_component, parent: :component do
    name { Decidim::Components::Namer.new(participatory_space.organization.available_locales, :idcat_mobil).i18n_name }
    manifest_name { :idcat_mobil }
    # rubocop:disable FactoryBot/FactoryAssociationWithStrategy
    participatory_space { create(:participatory_process, :with_steps) }
    # rubocop:enable FactoryBot/FactoryAssociationWithStrategy
  end

  # Add engine factories here
end
