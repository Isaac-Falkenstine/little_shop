require 'rails_helper'

feature "when a merchant user is logged in" do

  it 'item belongs to a specific merchant' do
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
    fill_in :item_name, with: "Jeep"
    fill_in :item_description, with: "kick ass off road vehicle!"
    fill_in :item_thumbnail, with: "https://cimg6.ibsrv.net/gimg/www.jk-forum.com-vbulletin/2000x1333/img_7093_ace7e7a15cab63d32c9fe40f367bdc0baf8ec8b3.jpg"
    fill_in :item_price, with: 55000
    fill_in :item_inventory, with: 55
    click_on 'Create Item'

    expect(current_path).to eq(dashboard_items_path)
    # save_and_open_page
    expect(page).to have_content "Jeep"
  end

it "they can navigate to adding an item" do
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

  it "they can add item" do
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
    fill_in :item_name, with: "Jeep"
    fill_in :item_description, with: "kick ass off road vehicle!"
    fill_in :item_thumbnail, with: "https://cimg6.ibsrv.net/gimg/www.jk-forum.com-vbulletin/2000x1333/img_7093_ace7e7a15cab63d32c9fe40f367bdc0baf8ec8b3.jpg"
    fill_in :item_price, with: 55000
    fill_in :item_inventory, with: 55
    click_on 'Create Item'
  end

  describe "they can add item" do
    before(:each) do
      @merchant_user = User.create(first_name: "Merchant", last_name: "User", street_address: "1234 Boss St.",
                             city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "merchant@email.com", password: "pass123", role: 1)

      @item_1 = @merchant_user.items.create(name: "thing1", description: "this beer is delicious", price: 5.99, thumbnail: "go here", inventory: 10)
      @item_2 = @merchant_user.items.create(name: "thing2", description: "this shepherds pie is ok", price: 4.99, thumbnail: "go here", inventory: 20)
    end

    it "check item enable and change" do
      visit root_path
      click_on 'Login'
      fill_in :email_address, with: @merchant_user.email_address
      fill_in :password, with: @merchant_user.password
      click_on 'Login To The Pub'
      click_on 'Dashboard'
      click_on 'Your Items'
      expect(page).to_not have_content("Enabled: true")
      within "#item-#{@item_1.id}" do
        click_on 'Enable'
      end
      expect(page).to have_content("Item is now available for sale")
      expect(page).to have_content("Enabled: true")

      within "#item-#{@item_1.id}" do
        click_on 'Disable'
      end
      expect(page).to have_content("Item is no longer for sale")
      expect(page).to_not have_content("Enabled: true")

    end

  end

end
