require 'rails_helper'

RSpec.describe "tenancies#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/tenancies", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:tenancy)
    end
    let(:payload) do
      {
        data: {
          type: 'tenancies',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(TenancyResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Tenancy.count }.by(1)
    end
  end
end
