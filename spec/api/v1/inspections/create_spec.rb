require 'rails_helper'

RSpec.describe "inspections#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/inspections", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:inspection)
    end
    let(:payload) do
      {
        data: {
          type: 'inspections',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(InspectionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Inspection.count }.by(1)
    end
  end
end
