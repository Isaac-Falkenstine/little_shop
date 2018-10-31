require 'rails_helper'

describe 'specific merchant statistics are available in Dashboard ' do

  it 'can show total items sold as percentage based on total items' do
    @merchant = create(:merchant)

    item_1 = create(:item, user_id: merchant.id, inventory: 1500)

    user_1 = create(:user, state: "Texas", city: "Austin")
    user_2 = create(:user, state: "Texas", city: "Dallas")
    user_3 = create(:user, state: "Texas", city: "San Antonio")
    user_4 = create(:user, state: "Texas", city: "El Paso")
    user_5 = create(:user, state: "New York", city: "Brooklyn")
    user_6 = create(:user, state: "Colorado", city: "Denver")
    user_7 = create(:user, state: "Colorado", city: "Fort Collins")
    user_8 = create(:user, state: "Alaska", city: "Anchridge")

    order_1 = user_1.orders.create!(status: 2)
    order_2 = user_1.orders.create!(status: 2)
    order_3 = user_1.orders.create!(status: 2)
    order_4 = user_1.orders.create!(status: 2)
    order_5 = user_2.orders.create!(status: 2)
    order_6 = user_2.orders.create!(status: 2)
    order_7 = user_2.orders.create!(status: 2)
    order_8 = user_3.orders.create!(status: 2)
    order_9 = user_3.orders.create!(status: 2)
    order_10 = user_3.orders.create!(status: 2)
    order_11 = user_4.orders.create!(status: 2)
    order_12 = user_5.orders.create!(status: 2)
    order_13 = user_5.orders.create!(status: 2)
    order_13 = user_6.orders.create!(status: 2)
    order_14 = user_6.orders.create!(status: 2)
    order_15 = user_6.orders.create!(status: 2)
    order_16 = user_7.orders.create!(status: 2)
    order_17 = user_7.orders.create!(status: 2)
    order_18 = user_7.orders.create!(status: 2)
    order_19 = user_1.orders.create!(status: 2)
    order_20 = user_1.orders.create!(status: 2)

    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_1.id, amount: item_1.price, count: 100)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_2.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_3.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_4.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_5.id, amount: item_1.price, count: 80)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_6.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_7.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_8.id, amount: item_1.price, count: 75)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_9.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_10.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_11.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_12.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_13.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_14.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_15.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_16.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_17.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_18.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_19.id, amount: item_1.price, count: 2)
    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_20.id, amount: item_1.price, count: 2)

    visit root_path

    click_on 'Login'

    expect(current_path).to eq(login_path)
    fill_in :email_address, with: merchant.email_address
    fill_in :password, with: merchant.password
    click_on 'Login To The Pub'
    visit dashboard_user_path(merchant)

    expect(page).to have_content("Statistics (Top Sold)")
    expect(page).to have_content("Sold Items(%) #{@merchant.percent_sold}")
    expect(page).to have_content("Top 3 States: #{@merchant.merchant_top_states }")
    expect(page).to have_content("Top 3 Cities: #{@merchant.merchant_top_cities }")
    expect(page).to have_content("Most Active User: ")
    expect(page).to have_content("Largest Order: ")
    expect(page).to have_content("Top 3 Biggest Spending Users: ")

  end

end
