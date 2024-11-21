require 'rails_helper'

RSpec.describe TenancyResource, type: :resource do
  describe 'serialization' do
    let!(:tenancy) { create(:tenancy) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(tenancy.id)
      expect(data.jsonapi_type).to eq('tenancies')
    end
  end

  describe 'filtering' do
    let!(:tenancy1) { create(:tenancy) }
    let!(:tenancy2) { create(:tenancy) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: tenancy2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([tenancy2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:tenancy1) { create(:tenancy) }
      let!(:tenancy2) { create(:tenancy) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            tenancy1.id,
            tenancy2.id
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
            tenancy2.id,
            tenancy1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
