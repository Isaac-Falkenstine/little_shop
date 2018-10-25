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
end
