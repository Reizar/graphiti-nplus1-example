require 'rails_helper'

RSpec.describe "tenancies#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tenancies", params: params
  end

  describe 'basic fetch' do
    let!(:tenancy1) { create(:tenancy) }
    let!(:tenancy2) { create(:tenancy) }

    it 'works' do
      expect(TenancyResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['tenancies'])
      expect(d.map(&:id)).to match_array([tenancy1.id, tenancy2.id])
    end
  end
end
