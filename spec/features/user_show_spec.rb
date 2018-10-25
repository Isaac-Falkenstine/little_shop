require 'rails_helper'

describe 'user show page' do
  it 'user can see their info on their show page' do
    user = create(:user)

    visit user_path(User.last)

    expect(page).to have_content("Your personal info:")
    expect(page).to have_content(user.street_address)
    expect(page).to have_content(user.state)
    expect(page).to have_content(user.zip)
    expect(page).to have_content(user.city)
    expect(page).to have_content(user.email_address)
  end

  it 'user can edit their info on their show page' do
    visit '/'

    click_on 'Register'

    expect(current_path).to eq(new_user_path)
    fill_in :user_email_address, with: "isaac@email.com"
    fill_in :user_password, with: 'test1234'
    fill_in :user_first_name, with: "Isaac"
    fill_in :user_last_name, with: 'Falkenstine'
    fill_in :user_street_address, with: "1234 Coral Ln."
    fill_in :user_city, with: 'Denver'
    fill_in :user_zip, with: 123456
    fill_in :user_state, with: 'Colorado'

    click_on 'Create User'
    expect(current_path).to eq(user_path(User.last))

    click_on("Edit your personal info")

    expect(current_path).to eq(edit_user_path(User.last))

    fill_in :user_first_name, with: "Isaak"
    fill_in :user_last_name, with: 'Falkenstein'

    click_on("Update User")
    
    expect(page).to have_content("Isaak")
    expect(page).to have_content("Falkenstein")

  end
end
