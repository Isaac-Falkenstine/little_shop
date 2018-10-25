require "rails_helper"
  describe User, type: :model do
    describe "validations" do
      it {should validate_presence_of(:first_name)}
      it {should validate_presence_of(:last_name)}
      it {should validate_presence_of(:street_address)}
      it {should validate_presence_of(:email_address)}
      it {should validate_uniqueness_of(:email_address) }
      it {should validate_presence_of(:password)}
      it {should validate_presence_of(:city)}
      it {should validate_presence_of(:zip)}
      it {should validate_presence_of(:state)}
    end
  end

  describe User, type: :model do
    describe 'Relationship' do
      it {should have_many(:orders)}
    end

  it "enabled is false by default" do
    default = User.create!(first_name: "def", last_name: "plugs", street_address: '123 fake st', email_address: 'fake@gmail.com', password: "12345", city: "Nowhere", zip:18333, state: "NH", role: 0)
    merchant = User.create!(first_name: "merch", last_name: "plugs", street_address: '123 sell fake st', email_address: 'merchant@pubshop.com', password: "12345", city: "Nowhere", zip:18333, state: "NH", role: 1)
    admin = User.create!(first_name: "admin", last_name: "plugs", street_address: '123 big fake st', email_address: 'admin@pubshop.com', password: "12345", city: "Nowhere", zip:18333, state: "NH", role: 2)

    expect(default.role).to eq("default")
    expect(merchant.role).to eq("merchant")
    expect(admin.role).to eq("admin")
  end
end

