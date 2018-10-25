require "rails_helper"
  describe User, type: :model do
    describe "validations" do
      it {should validate_presence_of(:first_name)}
      it {should validate_presence_of(:last_name)}
      it {should validate_presence_of(:street_address)}
      it {should validate_presence_of(:email_address)}
      it { should validate_uniqueness_of(:email_address) }
      it {should validate_presence_of(:password)}
      it {should validate_presence_of(:city)}
      it {should validate_presence_of(:zip)}
      it {should validate_presence_of(:state)}
    end
  end

  describe User, type: :model do
    describe 'Relationship' do
      it { should have_many(:orders)}
    end
  end
