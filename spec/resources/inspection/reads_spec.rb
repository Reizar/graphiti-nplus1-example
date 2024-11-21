require 'rails_helper'

RSpec.describe InspectionResource, type: :resource do
  describe 'serialization' do
    let!(:inspection) { create(:inspection) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(inspection.id)
      expect(data.jsonapi_type).to eq('inspections')
    end
  end

  describe 'filtering' do
    let!(:inspection1) { create(:inspection) }
    let!(:inspection2) { create(:inspection) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: inspection2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([inspection2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:inspection1) { create(:inspection) }
      let!(:inspection2) { create(:inspection) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            inspection1.id,
            inspection2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            inspection2.id,
            inspection1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
