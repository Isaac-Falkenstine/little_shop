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
    fill_in :user_zip, with: 12345
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
    expect(page).to have_content("Info succesfully edited!")

  end

  it 'user cant change their email to a existing one' do
    User.create(first_name: "R", last_name: "U", street_address: "1", city: "L", state: "C",
                zip: 81234, email_address: "1234@email.com", password: "pass123")

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

    click_on("Edit your personal info")

    expect(current_path).to eq(edit_user_path(User.last))

    fill_in :user_email_address, with: "1234@email.com"

    click_on("Update User")

    expect(current_path).to eq(edit_user_path(User.last))
    expect(page).to have_content("Edit your info here:")
    expect(page).to have_content("That E-Mail is already in use!")
  end
end
