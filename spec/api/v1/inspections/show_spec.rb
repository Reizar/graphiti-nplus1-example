require 'rails_helper'

RSpec.describe "inspections#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/inspections/#{inspection.id}", params: params
  end

  describe 'basic fetch' do
    let!(:inspection) { create(:inspection) }

    it 'works' do
      expect(InspectionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('inspections')
      expect(d.id).to eq(inspection.id)
    end
  end
end
