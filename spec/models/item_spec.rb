require "rails_helper"

  describe Item, type: :model do
    describe "validations" do
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:thumbnail)}
      it {should validate_presence_of(:price)}
      it {should validate_presence_of(:inventory)}
      it {should validate_presence_of(:description)}
    end
  end
