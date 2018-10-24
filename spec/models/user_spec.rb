require "rails_helper"
  describe User, type: :model do
    describe "validations" do
      it {should validate_presence_of(:first_name)}
      it {should validate_presence_of(:last_name)}
      it {should validate_presence_of(:street_address)}
      it {should validate_presence_of(:email_address)}
      it {should validate_presence_of(:password)}
      it {should validate_presence_of(:role)}
      it {should validate_presence_of(:city)}
      it {should validate_presence_of(:zip)}

    end
  end

  describe User, type: :model do
    describe 'Relationship' do
      it { should have_many(:order_items)}
      it { should have_many(:orders)}
      it { should have_many(:user_states)}
      it { should have_many(:states)}
    end
  end