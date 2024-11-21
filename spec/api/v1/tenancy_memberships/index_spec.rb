require 'rails_helper'

RSpec.describe "tenancy_memberships#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tenancy_memberships", params: params
  end

  describe 'basic fetch' do
    let!(:tenancy_membership1) { create(:tenancy_membership) }
    let!(:tenancy_membership2) { create(:tenancy_membership) }

    it 'works' do
      expect(TenancyMembershipResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['tenancy_memberships'])
      expect(d.map(&:id)).to match_array([tenancy_membership1.id, tenancy_membership2.id])
    end
  end
end
