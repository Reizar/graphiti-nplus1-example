require 'rails_helper'

RSpec.describe "tenancies#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/tenancies/#{tenancy.id}", payload
  end

  describe 'basic update' do
    let!(:tenancy) { create(:tenancy) }

    let(:payload) do
      {
        data: {
          id: tenancy.id.to_s,
          type: 'tenancies',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(TenancyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { tenancy.reload.attributes }
    end
  end
end
