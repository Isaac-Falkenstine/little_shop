require "rails_helper"

  describe Order, type: :model do
    describe "validations" do
      it {should validate_presence_of(:total)}
    end
  end

  describe Order, type: :model do
    describe 'Relationship' do
      it { should have_many(:order_items)}
      it { should have_many(:items).through(:order_items)}
      it { should belong_to(:user)}
    end
  end
