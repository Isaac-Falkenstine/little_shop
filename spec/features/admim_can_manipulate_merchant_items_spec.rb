require 'rails_helper'

describe 'When youre an admin user' do
  before(:each) do
    admin_1 = create(:admin)
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id)
    item_2 = create(:item, user_id: merchant_1.id)

    visit root_path

    click_on 'Login'

    expect(current_path).to eq(login_path)
    fill_in :email_address, with: admin_1.email_address
    fill_in :password, with: admin_1.password
    click_on 'Login To The Pub'
    expect(current_path).to eq(user_path(admin_1))
    expect(page).to have_content("Welcome, #{admin_1.first_name}")
  end

  it 'can navigate to merchants items' do

    admin_1 = create(:admin)
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id)
    item_2 = create(:item, user_id: merchant_1.id)

    click_on 'Account'
    click_on 'Users'
    expect(current_path).to eq(users_path)
    click_on merchant_1.email_address
    click_on "Merchant's Items"
    save_and_open_page
    expect(page).to eq()
  end



end
