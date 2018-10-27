require 'rails_helper'

feature "a user can see dashboard" do
  scenario "after when logged in" do

    visit '/'

    click_on 'Register'

    expect(current_path).to eq(new_user_path)
    fill_in :user_email_address, with: "isaac@email.com"
    fill_in :user_password, with: 'test1234'
    fill_in :user_first_name, with: "Isaac"
    fill_in :user_last_name, with: 'Falkenstine'
    fill_in :user_street_address, with: "1234 Coral Ln."
    fill_in :user_city, with: 'Denver'
    fill_in :user_zip, with: 12345
    fill_in :user_state, with: 'Colorado'

    click_on 'Create User'

    expect(current_path).to eq(user_path(User.last))
    click_on "Dashboard"
    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("#{User.last.first_name} Dashboard")
    expect(current_path).to eq("/dashboard")
  end
end
