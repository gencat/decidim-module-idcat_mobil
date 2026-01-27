# frozen_string_literal: true

require "decidim/admin"
require "decidim/verifications"

require "decidim/idcat_mobil/engine"
require "decidim/valid/on_omniauth_registration_listener"

module Decidim
  # This namespace holds the logic of the `IdcatMobil` component. This component
  # allows users to create idcat_mobil in a participatory space.
  module IdcatMobil
  end

  # The VÀLid module is only used for the user Verification.
  module Valid
    include ActiveSupport::Configurable

    # how long the verification will be valid, defaults to 90 days
    # if empty or nil, the verification will never expire
    config_accessor :verification_expiration_time do
      ENV.fetch("VERIFICATION_EXPIRATION_TIME", 90).to_i.days
    end
  end
end

require "decidim/valid/workflow"
