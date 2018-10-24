require "rails_helper"
  describe OrderItem, type: :model do
    describe "validations" do
      it {should validate_presence_of(:count)}
    end
  end
  describe OrderItem, type: :model do
    describe 'Relationship' do
      it { should belong_to(:order)}
      it { should belong_to(:item)}
    end
  end