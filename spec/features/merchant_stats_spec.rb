require 'rails_helper'

describe 'specific merchant statistics are available in Dashboard ' do

  it 'can show total items sold as percentage based on total items' do
    merchant = create(:merchant)

    item_1 = create(:item, user_id: merchant.id)
    item_2 = create(:item, user_id: merchant.id)
    item_3 = create(:item, user_id: merchant.id)
    item_4 = create(:item, user_id: merchant.id)
    item_5 = create(:item, user_id: merchant.id)
    item_6 = create(:item, user_id: merchant.id)

    user_1 = create(:user, state: "Texas")
    user_2 = create(:user, state: "Texas")

    order_1 = user_1.orders.create!(status: 2)
    order_2 = user_1.orders.create!(status: 2)
    order_3 = user_1.orders.create!(status: 2)
    order_4 = user_1.orders.create!(status: 0)

    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_1.id, amount: item_1.price, count: 2)

    # page.driver.post(login_path, email: merchant.email_address, password: "password 1")
    visit root_path

    click_on 'Login'

    expect(current_path).to eq(login_path)
    fill_in :email_address, with: merchant.email_address
    fill_in :password, with: merchant.password
    click_on 'Login To The Pub'
    visit dashboard_user_path(merchant)

    expect(page).to have_content("Statistics (Top Sold)")
    expect(page).to have_content("Sold Items(%) #{merchant.percent_sold}")
    expect(page).to have_content("Top 3 States: #{merchant.merchant_top_states }")

  end

  it 'can show top 3 states where items are shipped' do

  end

  it 'can show top 3 cities in each state where items are shipped' do

  end


end
