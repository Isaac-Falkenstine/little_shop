require "rails_helper"

  describe Cart, type: :model do
    describe "validations" do
      it {should validate_presence_of(:item)}
    end

  describe 'Relationship' do
    it { should have_many(:cart_items)}
    it { should have_many(:items).through(:cart_items)}
    end
  end
