require 'rails_helper'

RSpec.describe "properties#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/properties/#{property.id}", payload
  end

  describe 'basic update' do
    let!(:property) { create(:property) }

    let(:payload) do
      {
        data: {
          id: property.id.to_s,
          type: 'properties',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PropertyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { property.reload.attributes }
    end
  end
end
