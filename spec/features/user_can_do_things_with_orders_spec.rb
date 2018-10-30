require 'rails_helper'


RSpec.describe 'user visits order show page' do
  it 'sees a list of orders for specific orders' do
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

    # order_item_1 = user_1.OrderItem.create!(
    #   item_id: item_1.id,
    #   order_id: order_1.id,
    #   count: 5,
    #   amount: item_1.price
    # )
 
    # order_item_2 = OrderItem.create!(
    #   item_id: item_4.id,
    #   order_id: order_1.id,
    #   count: 3,
    #   amount: item_4.price
    # )
    # order_item_3 = OrderItem.create(
    #   item_id: item_2.id,
    #   order_id: order_2.id,
    #   count: 7,
    #   amount: item_2.price
    # )
    # order_item_4 = OrderItem.create(
    #   item_id: item_3.id,
    #   order_id: order_2.id,
    #   count: 2,
    #   amount: item_3.price
    # )
    # order_item_5 = OrderItem.create(
    #   item_id: item_5.id,
    #   order_id: order_3.id,
    #   count: 100,
    #   amount: item_5.price
    # )
    # order_item_6 = OrderItem.create(
    #   item_id: item_5.id,
    #   order_id: order_4.id,
    #   count: 10,
    #   amount: item_5.price
    # )
    # order_item_7 = OrderItem.create(
    #   item_id: item_4.id,
    #   order_id: order_5.id,
    #   count: 1,
    #   amount: item_4.price
    # )
    
  
    
    visit profile_orders_path
    
    save_and_open_page
  end
end
