require 'rails_helper'

RSpec.describe "tenancies#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/tenancies/#{tenancy.id}"
  end

  describe 'basic destroy' do
    let!(:tenancy) { create(:tenancy) }

    it 'updates the resource' do
      expect(TenancyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Tenancy.count }.by(-1)
      expect { tenancy.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
