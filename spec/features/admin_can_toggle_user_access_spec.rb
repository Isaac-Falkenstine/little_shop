require 'rails_helper'

describe "when youre a merchant or admin" do
  before(:each) do
    @admin_user = User.create(first_name: "Admin", last_name: "User", street_address: "1234 Boss St.",
                           city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "admin@email.com", password: "pass123", role: 2)

    @default_user = User.create(first_name: "Dude", last_name: "User", street_address: "1234 Anywhere St.",
                           city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "user@email.com", password: "pass123")

    @disabled_user = User.create(first_name: "Sad", last_name: "User", street_address: "1234 Anywhere St.", enabled: false,
                           city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "saduser@email.com", password: "pass123")
  end

  it "disables a user" do

    visit '/'
    click_on 'Login'
    fill_in :email_address, with: @admin_user.email_address
    fill_in :password, with: @admin_user.password
    click_on 'Login To The Pub'
    click_on "Account"
    click_on "Users"
    within "#user-#{@default_user.id}" do
      click_on "Disable"
    end
    click_on 'Logout'
    click_on 'Login'
    fill_in :email_address, with: @default_user.email_address
    fill_in :password, with: @default_user.password
    click_on 'Login To The Pub'
    expect(page).to have_content("Account disabled")
    expect(page).to have_content("Login")

  end

  it "enables a user" do

    visit '/'
    click_on 'Login'
    fill_in :email_address, with: @admin_user.email_address
    fill_in :password, with: @admin_user.password
    click_on 'Login To The Pub'
    click_on "Account"
    click_on "Users"
    within "#user-#{@disabled_user.id}" do
      click_on "Enable"
    end
    click_on 'Logout'
    click_on 'Login'
    fill_in :email_address, with: @disabled_user.email_address
    fill_in :password, with: @disabled_user.password
    click_on 'Login To The Pub'
    expect(page).to have_content("Welcome")
    expect(page).to have_content("Logout")

  end

  it "upgrades a user" do

    visit '/'
    click_on 'Login'
    fill_in :email_address, with: @admin_user.email_address
    fill_in :password, with: @admin_user.password
    click_on 'Login To The Pub'
    click_on "Account"
    click_on "Users"
    within "#user-#{@default_user.id}" do
      click_on "Upgrade"
    end
    expect(page).to have_content("User #{@default_user.id} has been upgraded")
    expect(User.find(@default_user.id).role).to eq("merchant")

  end


end
