require 'rails_helper'

describe Spree::StoreCredit, :type => :model do
  it { is_expected.to respond_to(:amount) }
  it { is_expected.to respond_to(:reason) }
  it { is_expected.to respond_to(:user) }

  context '#validations' do
    it 'should ensure the presence of an amount' do
      sc = build(:store_credit)
      expect(sc).to be_valid
      sc.amount = nil
      expect(sc).not_to be_valid
    end

    it 'should ensure the numericality of an amount' do
      sc = build(:store_credit)
      expect(sc).to be_valid
      sc.amount = 'not_a_number'
      expect(sc).not_to be_valid
    end

    it 'should ensure the presence of a reason' do
      sc = build(:store_credit)
      expect(sc).to be_valid
      sc.reason = nil
      expect(sc).not_to be_valid
    end

    it 'should ensure the presence of a user' do
      sc = build(:store_credit)
      expect(sc).to be_valid
      sc.user = nil
      expect(sc).not_to be_valid
    end
  end
end