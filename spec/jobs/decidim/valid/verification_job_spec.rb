# frozen_string_literal: true

require "spec_helper"

require "decidim/verifications/valid_handler"

module Decidim::Valid
  describe VerificationJob do
    let!(:organization) { create(:organization, host: "#{SecureRandom.hex(10)}.example.com") }
    let!(:user) { create(:user, organization:) }
    let!(:identity) { create(:identity, provider: "idcat_mobil", user:) }

    let(:oauth_data) do
      {
        user_id: user.id,
        identity_id: identity.id,
        provider: "idcat_mobil",
        uid: "00000000K",
        email: user.email,
        name: "Alice",
        nickname: "alice",
        avatar_url: nil,
        raw_data: {
          provider: :idcat_mobil,
          uid: "00000000K",
          info: {
            email: user.email,
            name: "Alice",
            prefix: "0034",
            phone: "972972972",
            surname1: "COOPER",
            surname2: "IRON",
            surnames: "COOPER IRON",
            country_code: "ES"
          },
          credentials: {
            token: "1/abcdefABCDEFGHIJKLMNOPQRSTUVWXYZabcdefgh",
            expires_at: 1_773_128_240,
            expires: true
          },
          extra: {
            identifier_type: "1",
            method: "idcatmobil",
            assurance_level: "low",
            status: "ok"
          }
        }
      }
    end

    context "when omniauth_registration event is notified" do
      context "when authorization is created with success" do
        it "notifies the user for the success" do
          expect(Decidim::EventsManager)
            .to receive(:publish)
            .with(
              event: "decidim.verifications.idcat_mobil.ok",
              event_class: Decidim::IdcatMobil::VerificationSuccessNotification,
              resource: user,
              affected_users: [user],
              extra: {
                status: :ok,
                errors: []
              }
            )

          VerificationJob.new.perform(oauth_data)
        end
      end

      context "when authorization creation fails" do
        let(:oauth_data) do
          super().merge(status: "invalid", "status" => "invalid")
        end

        it "notifies the user for the failure" do
          expect(Decidim::EventsManager)
            .to receive(:publish)
            .with(hash_including(
                    event: "decidim.verifications.idcat_mobil.invalid",
                    event_class: Decidim::IdcatMobil::VerificationInvalidNotification,
                    resource: user,
                    affected_users: [user],
                    extra: hash_including(
                      status: :invalid,
                      errors: ["Unique cannot be blank"]
                    )
                  ))

          oauth_data.delete(:uid)
          VerificationJob.new.perform(oauth_data)
        end
      end
    end
  end
end
