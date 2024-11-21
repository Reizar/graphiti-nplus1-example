require 'rails_helper'

RSpec.describe TenancyMembershipResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'tenancy_memberships',
          attributes: attributes_for(:tenancy_membership)
        }
      }
    end

    let(:instance) do
      TenancyMembershipResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { TenancyMembership.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:tenancy_membership) { create(:tenancy_membership) }

    let(:payload) do
      {
        data: {
          id: tenancy_membership.id.to_s,
          type: 'tenancy_memberships',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      TenancyMembershipResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { tenancy_membership.reload.updated_at }
      # .and change { tenancy_membership.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:tenancy_membership) { create(:tenancy_membership) }

    let(:instance) do
      TenancyMembershipResource.find(id: tenancy_membership.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { TenancyMembership.count }.by(-1)
    end
  end
end
