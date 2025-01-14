require 'rails_helper'

RSpec.describe InspectionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'inspections',
          attributes: attributes_for(:inspection)
        }
      }
    end

    let(:instance) do
      InspectionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Inspection.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:inspection) { create(:inspection) }

    let(:payload) do
      {
        data: {
          id: inspection.id.to_s,
          type: 'inspections',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      InspectionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { inspection.reload.updated_at }
      # .and change { inspection.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:inspection) { create(:inspection) }

    let(:instance) do
      InspectionResource.find(id: inspection.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Inspection.count }.by(-1)
    end
  end
end
