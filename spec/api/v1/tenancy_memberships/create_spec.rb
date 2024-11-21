require 'rails_helper'

RSpec.describe "tenancy_memberships#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/tenancy_memberships", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:tenancy_membership)
    end
    let(:payload) do
      {
        data: {
          type: 'tenancy_memberships',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(TenancyMembershipResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { TenancyMembership.count }.by(1)
    end
  end
end
