require 'rails_helper'

RSpec.describe "inspections#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/inspections/#{inspection.id}", payload
  end

  describe 'basic update' do
    let!(:inspection) { create(:inspection) }

    let(:payload) do
      {
        data: {
          id: inspection.id.to_s,
          type: 'inspections',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(InspectionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { inspection.reload.attributes }
    end
  end
end
