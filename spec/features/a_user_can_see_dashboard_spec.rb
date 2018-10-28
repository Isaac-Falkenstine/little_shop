require 'rails_helper'

describe "when youre a merchant or admin" do
  before(:each) do
    @merch_user = User.create(first_name: "Merchant", last_name: "User", street_address: "1234 Sales St.",
                          city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "merchant1@email.com", password: "pass123", role: 1)

    @admin_user = User.create(first_name: "Admin", last_name: "User", street_address: "1234 Boss St.",
                           city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "admin@email.com", password: "pass123", role: 2)
  end

  it "you shows a merchant dashboard link" do

    visit '/'
    click_on 'Login'
    fill_in :email_address, with: @merch_user.email_address
    fill_in :password, with: @merch_user.password
    click_on 'Login To The Pub'
    click_on "Account"
    expect(page).to have_content("Dashboard")
    click_on "Logout"
  end

  it "you shows an admin dashboard and users link" do

    visit '/'
    click_on 'Login'
    fill_in :email_address, with: @admin_user.email_address
    fill_in :password, with: @admin_user.password
    click_on 'Login To The Pub'
    click_on "Account"
    expect(page).to have_content("Dashboard")
    expect(page).to have_content("Users")
    click_on "Logout"
  end

end
