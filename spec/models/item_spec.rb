require "rails_helper"

  describe Item, type: :model do
    describe "validations" do
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:thumbnail)}
      it {should validate_presence_of(:price)}
      it {should validate_presence_of(:inventory)}
      it {should validate_presence_of(:description)}
      # it {should validate_presence_of(:enabled)}
    end
  end

  # describe 'Relationship' do
  #   it { should have_many(:cart_items)}
  #   it { should have_many(:items).through(:cart_items)}
  #   end
  # end