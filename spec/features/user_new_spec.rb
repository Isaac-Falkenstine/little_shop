require 'rails_helper'

describe 'user registration' do
  it 'anonymous visitor fails registration because it was blank' do
    visit new_user_path
    click_on 'Create User'
    expect(current_path).to eq(users_path)
    expect(page).to have_button("Create User")
  end

  it 'anonymous visitor fails registration because user existed' do
    username = 'fred'
    User.create(username: username, password: 'test1234')
    visit new_user_path
    fill_in :user_username, with: username
    fill_in :user_password, with: '9876test'

    click_on 'Create User'
    expect(current_path).to eq(users_path)
    expect(page).to have_button("Create User")
  end

  it 'anonymous visitor' do
    username = 'fred'
    visit '/'

    click_on 'Sign up to be a new user'

    expect(current_path).to eq(new_user_path)
    fill_in :user_username, with: username
    fill_in :user_password, with: 'test1234'

    click_on 'Create User'

    expect(page).to have_content("Welcome, #{username}")
  end
end
