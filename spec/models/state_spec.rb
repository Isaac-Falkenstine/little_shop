require "rails_helper"
  describe State, type: :model do
    describe "validations" do
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:abbr)}
    end
  end

  describe State, type: :model do
    describe "Relationships" do
      it {should belong_to(:user)}
    end
  end