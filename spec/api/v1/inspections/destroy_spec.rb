require 'rails_helper'

RSpec.describe "inspections#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/inspections/#{inspection.id}"
  end

  describe 'basic destroy' do
    let!(:inspection) { create(:inspection) }

    it 'updates the resource' do
      expect(InspectionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Inspection.count }.by(-1)
      expect { inspection.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
