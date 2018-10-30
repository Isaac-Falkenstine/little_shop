require 'rails_helper'

describe 'When youre an admin user' do
  before(:each) do
    @admin_1 = create(:admin)
    @merchant_1 = create(:merchant)
    @item_1 = create(:item, user_id: @merchant_1.id)
    @item_2 = create(:item, user_id: @merchant_1.id)

    visit root_path

    click_on 'Login'

    fill_in :email_address, with: @admin_1.email_address
    fill_in :password, with: @admin_1.password
    click_on 'Login To The Pub'
  end

  it 'can navigate to merchants items' do
    click_on 'Account'
    click_on 'Users'
    click_on @merchant_1.email_address
    click_on "See Merchant's Dashboard"
    click_on "Your Items"

    expect(page).to have_content(@item_1.name)
  end



end
