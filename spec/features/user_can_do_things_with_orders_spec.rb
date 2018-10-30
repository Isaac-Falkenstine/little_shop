require 'rails_helper'


RSpec.describe 'user visits order show page' do
  xit 'sees a list of orders for specific orders' do
    admin = create(:admin)
    merchant = create(:merchant)
    user_1 = create(:user)
    user_2 = create(:user)
    user_3 = create(:user)

    item_1 = create(:item, user_id: merchant.id)
    item_2 = create(:item, user_id: merchant.id)


    item_3 = create(:item, user_id: merchant.id)
    item_4 = create(:item, user_id: merchant.id)
    item_5 = create(:item, user_id: merchant.id)

    order_1 = user_1.orders.create!(total: 20, status: :complete)
    order_2 = user_1.orders.create!(total: 20, status: :complete)
    order_3 = user_2.orders.create!(total: 20, status: :pending)
    order_4 = user_2.orders.create!(total: 20, status: :complete)
    order_5 = user_3.orders.create!(total: 20, status: :complete)

    visit carts_path

    expect(page).to have_content("Check Out")

    click_on "Check Out"

    expect(current_path).to eq(profile_orders_path)

  end
end
