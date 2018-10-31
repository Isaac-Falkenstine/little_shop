require 'rails_helper'

describe 'user cart empties' do
  it 'when logged out' do
    user = create(:user)
    merchant = create(:merchant)
    item_1 = create(:item, user_id: merchant.id, inventory: 80)

    visit login_path

    fill_in :email_address, with: user.email_address
    fill_in :password, with: user.password
    click_on 'Login To The Pub'

    visit items_path

    click_on "Add To Cart"
    click_on "Add To Cart"
    click_on "Add To Cart"

    expect(page).to have_content("Cart Items: 3")
    click_on "Logout"
    expect(page).to have_content("Cart Items: 0")
  end
end
