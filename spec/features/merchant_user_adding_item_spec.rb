require 'rails_helper'

feature "when a merchant user is logged in" do

  scenario "they can navigate to adding an item" do
    merchant = create(:merchant)

    visit root_path

    click_on 'Login'

    expect(current_path).to eq(login_path)
    fill_in :email_address, with: merchant.email_address
    fill_in :password, with: merchant.password
    click_on 'Login To The Pub'
    expect(current_path).to eq(user_path(merchant))
    expect(page).to have_content("Welcome, #{merchant.first_name}")

    click_on 'Dashboard'

    expect(current_path).to eq(dashboard_user_path(merchant))
    expect(page).to have_content("Welcome, #{merchant.first_name} To Your merchant Dashboard")

    click_on 'Your Items'
    click_on 'Add Item'
    expect(current_path).to eq(new_dashboard_item_path)
  end

  scenario "they can add item" do
    merchant = create(:merchant)

    visit root_path

    click_on 'Login'

    expect(current_path).to eq(login_path)
    fill_in :email_address, with: merchant.email_address
    fill_in :password, with: merchant.password
    click_on 'Login To The Pub'
    expect(current_path).to eq(user_path(merchant))
    expect(page).to have_content("Welcome, #{merchant.first_name}")

    click_on 'Dashboard'

    expect(current_path).to eq(dashboard_user_path(merchant))
    expect(page).to have_content("Welcome, #{merchant.first_name} To Your merchant Dashboard")

    click_on 'Your Items'
    click_on 'Add Item'
    expect(current_path).to eq(new_dashboard_item_path)

    fill_in :iname, with: "Jeep"
    fill_in :description, with: "kick ass off road vehicle!"
    fill_in :thumbnail, with: "https://cimg6.ibsrv.net/gimg/www.jk-forum.com-vbulletin/2000x1333/img_7093_ace7e7a15cab63d32c9fe40f367bdc0baf8ec8b3.jpg"
    fill_in :price, with: 55000
    click_on 'submit'
  end
end
