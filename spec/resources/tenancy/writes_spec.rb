require 'rails_helper'

RSpec.describe TenancyResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'tenancies',
          attributes: attributes_for(:tenancy)
        }
      }
    end

    let(:instance) do
      TenancyResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Tenancy.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:tenancy) { create(:tenancy) }

    let(:payload) do
      {
        data: {
          id: tenancy.id.to_s,
          type: 'tenancies',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      TenancyResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { tenancy.reload.updated_at }
      # .and change { tenancy.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:tenancy) { create(:tenancy) }

    let(:instance) do
      TenancyResource.find(id: tenancy.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Tenancy.count }.by(-1)
    end
  end
end
