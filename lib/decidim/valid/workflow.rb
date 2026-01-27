# frozen_string_literal: true

# Verify the user with a VÀLid authentication when registered via OAuth
Decidim::Verifications.register_workflow(:valid) do |workflow|
  workflow.form = "Decidim::Verifications::ValidHandler"
  workflow.expires_in = Decidim::Valid.verification_expiration_time.to_i
end
