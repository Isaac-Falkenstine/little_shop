require 'rails_helper'

describe 'login process' do
  describe 'can login as registered user' do
    it 'should succeed' do
      user = create(:user)

      visit root_path

      click_on 'Login'

      expect(current_path).to eq(login_path)
      fill_in :email_address, with: user.email_address
      fill_in :password, with: user.password
      click_on 'Login To The Pub'
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.first_name}")
    end

    it 'should refresh with flash alert if login fails' do
      user = create(:user)

      visit login_path

      fill_in :email_address, with: user.email_address
      fill_in :password, with: "bonkers"
      click_on 'Login To The Pub'
      expect(current_path).to eq(login_path)
      expect(page).to have_content("LOGIN FAILED - try again")
    end

  end
end
