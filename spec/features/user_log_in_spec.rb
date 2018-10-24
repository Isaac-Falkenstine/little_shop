require 'rails_helper'
#must change the path into the actual welcome page
describe 'login process' do
  describe 'can login as registered user' do
    it 'should succeed' do
      user = create(:user)

      visit items_path

      click_on 'Login'
      click_on 'User'

      expect(current_path).to eq(login_path)
      fill_in :email_address, with: user.email_address
      fill_in :password, with: user.password
      click_on 'Login To The Pub'
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.first_name}")
    end
  end
end
