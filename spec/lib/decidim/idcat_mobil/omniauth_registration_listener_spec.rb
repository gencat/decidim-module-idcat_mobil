# frozen_string_literal: true

require "spec_helper"

module Decidim::IdcatMobil
  describe OnOmniauthRegistrationListener do
    describe "when omniauth_registration event is notified" do

      let(:raw_data) do {email: 'some@example.org'} end
      let(:data) do
        {provider: provider, raw_data: raw_data}
      end

      context "when it is an IdCat mòbil registration" do
        let(:provider) { 'idcat_mobil' }

        it "enqueues VerificationJob" do
          expect(Decidim::IdcatMobil::VerificationJob).to receive(:perform_later)
                  .with(raw_data)

          subject.on_omniauth_registration(raw_data)
        end
      end

      context "when it is not and IdCat mòbil registration" do
        let(:provider) { 'decidim' }
        it "does not enqueues VerificationJob" do
          expect(Decidim::IdcatMobil::VerificationJob).not_to receive(:perform_later)
        end
      end
    end
  end
end
