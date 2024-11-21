require 'rails_helper'

RSpec.describe "tenancy_memberships#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/tenancy_memberships/#{tenancy_membership.id}", payload
  end

  describe 'basic update' do
    let!(:tenancy_membership) { create(:tenancy_membership) }

    let(:payload) do
      {
        data: {
          id: tenancy_membership.id.to_s,
          type: 'tenancy_memberships',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(TenancyMembershipResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { tenancy_membership.reload.attributes }
    end
  end
end
