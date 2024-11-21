require 'rails_helper'

RSpec.describe "inspections#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/inspections", params: params
  end

  describe 'basic fetch' do
    let!(:inspection1) { create(:inspection) }
    let!(:inspection2) { create(:inspection) }

    it 'works' do
      expect(InspectionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['inspections'])
      expect(d.map(&:id)).to match_array([inspection1.id, inspection2.id])
    end
  end
end
