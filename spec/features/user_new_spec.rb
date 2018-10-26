require 'rails_helper'

describe 'user registration' do
  it 'anonymous visitor fails registration because it was blank' do
    visit new_user_path
    click_on 'Create User'
    expect(current_path).to eq(users_path)
    expect(page).to have_button("Create User")
  end

  it 'anonymous visitor fails registration because user existed' do
    user = create(:user)
    visit new_user_path
    fill_in :user_email_address, with: user.email_address
    fill_in :user_password, with: '9876test'

    click_on 'Create User'
    expect(current_path).to eq(users_path)
    expect(page).to have_button("Create User")
  end

  it 'anonymous visitor registers and sees pop up' do
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
    expect(User.last.role).to eq("default")
    expect(page).to have_content("Welcome, Isaac Falkenstine")
  end
end
