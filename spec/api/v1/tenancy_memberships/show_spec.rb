require 'rails_helper'

RSpec.describe "tenancy_memberships#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tenancy_memberships/#{tenancy_membership.id}", params: params
  end

  describe 'basic fetch' do
    let!(:tenancy_membership) { create(:tenancy_membership) }

    it 'works' do
      expect(TenancyMembershipResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('tenancy_memberships')
      expect(d.id).to eq(tenancy_membership.id)
    end
  end
end
