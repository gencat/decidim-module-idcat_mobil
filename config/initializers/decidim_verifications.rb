# Make IdCat mòbil handler accessible in the register:
# ```
# Decidim::AuthorizationHandler.handler_for(:idcat_mobil, ....)
# ```
Decidim::Verifications.register_workflow(:idcat_mobil) do |workflow|
  workflow.form = "Decidim::Verifications::IdCatMobilHandler"
end
