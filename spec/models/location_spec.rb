require "rails_helper"
  describe Location, type: :model do
    describe "validations" do
      it {should validate_presence_of(:city)}
      it {should validate_presence_of(:zip)}
    end
  end
#add state id relationships