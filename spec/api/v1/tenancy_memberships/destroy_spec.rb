require 'rails_helper'

RSpec.describe "tenancy_memberships#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/tenancy_memberships/#{tenancy_membership.id}"
  end

  describe 'basic destroy' do
    let!(:tenancy_membership) { create(:tenancy_membership) }

    it 'updates the resource' do
      expect(TenancyMembershipResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { TenancyMembership.count }.by(-1)
      expect { tenancy_membership.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
