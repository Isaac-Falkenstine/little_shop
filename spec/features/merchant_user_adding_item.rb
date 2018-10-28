require 'rails_helper'

feature "when a merchant user is logged in" do

  scenario "they can navigate to adding an item" do
    user = create(:merchant)

    visit root_path

    click_on 'Login'

    expect(current_path).to eq(login_path)
    fill_in :email_address, with: user.email_address
    fill_in :password, with: user.password
    click_on 'Login To The Pub'
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.first_name}")

    click_on 'Dashboard'

    expect(current_path).to eq(dashboard_users)
    expect(page).to have_content("Welcome, #{merchant.name} To Your merchant Dashboard")

    click_on 'Add Item'
    expect(current_path).to eq() 
  end
end
