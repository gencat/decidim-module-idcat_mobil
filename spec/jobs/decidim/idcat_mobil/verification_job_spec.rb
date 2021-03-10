# frozen_string_literal: true

require "spec_helper"

require "decidim/verifications/id_cat_mobil_handler"

module Decidim::IdcatMobil
  describe VerificationJob do

    let!(:user) { create(:user) }
    let!(:identity) { create(:identity, provider: 'idecat_mobil', user: user) }
    let(:oauth_data) do
      {
        user_id: user.id,
        identity_id: identity.id,
        provider: 'idcat_mobil',
        uid: "idcat_mobil/#{user.id}",
        email: user.email,
        name: 'idcat_mobil',
        nickname: nil,
        avatar_url: nil,
        raw_data: {}
      }
    end

    class TestRectifyPublisher < Rectify::Command
      include Wisper::Publisher
      def initialize(*args); end
    end
    def stub_rectify_publisher(clazz, called_method, event_to_publish, *published_event_args)
      stub_const(clazz, Class.new(TestRectifyPublisher) do
        define_method(called_method) do |*args|
          publish(event_to_publish, *published_event_args)
        end
      end)
    end

    context "when omniauth_registration event is notified" do
      context "when authorization is created with success" do
        it "notifies the user for the success" do
          stub_rectify_publisher('Decidim::Verifications::AuthorizeUser', :call, :ok)
          expect(Decidim::EventsManager)
            .to receive(:publish)
            .with(
              event: "decidim.verifications.idcat_mobil.ok",
              event_class: Decidim::IdcatMobil::VerificationSuccessNotification,
              recipient_ids: [user.id],
              extra: {
                status: :ok,
                errors: []
              }
            )

          VerificationJob.new.perform(oauth_data)
        end
      end

      context "when authorization creation fails" do
        it "notifies the user for the failure" do
          stub_rectify_publisher('Decidim::Verifications::AuthorizeUser', :call, :invalid)
          expect(Decidim::EventsManager)
            .to receive(:publish)
            .with(
              event: "decidim.verifications.idcat_mobil.invalid",
              event_class: Decidim::IdcatMobil::VerificationInvalidNotification,
              recipient_ids: [user.id],
              extra: {
                status: :invalid,
                errors: []
              }
            )

          VerificationJob.new.perform(oauth_data)
        end
      end
    end
  end
end
