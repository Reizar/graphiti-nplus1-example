require 'rails_helper'

RSpec.describe TenancyMembershipResource, type: :resource do
  describe 'serialization' do
    let!(:tenancy_membership) { create(:tenancy_membership) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(tenancy_membership.id)
      expect(data.jsonapi_type).to eq('tenancy_memberships')
    end
  end

  describe 'filtering' do
    let!(:tenancy_membership1) { create(:tenancy_membership) }
    let!(:tenancy_membership2) { create(:tenancy_membership) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: tenancy_membership2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([tenancy_membership2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:tenancy_membership1) { create(:tenancy_membership) }
      let!(:tenancy_membership2) { create(:tenancy_membership) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            tenancy_membership1.id,
            tenancy_membership2.id
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
            tenancy_membership2.id,
            tenancy_membership1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
