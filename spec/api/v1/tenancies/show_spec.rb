require 'rails_helper'

RSpec.describe "tenancies#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tenancies/#{tenancy.id}", params: params
  end

  describe 'basic fetch' do
    let!(:tenancy) { create(:tenancy) }

    it 'works' do
      expect(TenancyResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('tenancies')
      expect(d.id).to eq(tenancy.id)
    end
  end
end
