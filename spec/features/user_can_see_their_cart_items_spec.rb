require 'rails_helper'

RSpec.describe 'basic cart function' do
  it 'can add items to cart and see those items' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id)
    item_2 = create(:item, user_id: merchant_1.id)

    visit items_path

    within "#item-#{item_1.id}" do
      click_on "Add To Cart"
    end

    within "#item-#{item_1.id}" do
      click_on "Add To Cart"

    end

    within "#item-#{item_1.id}" do
      click_on "Add To Cart"
    end

    within "#item-#{item_2.id}" do
      click_on "Add To Cart"
    end

    click_on "Cart Items"
    expect(current_path).to eq("/cart")

    expect(page).to have_content("#{item_1.name}")
    expect(page).to have_content("Item price: $#{item_1.price}")
    expect(page).to have_content("#{merchant_1.first_name} #{merchant_1.last_name}")
    expect(page).to have_content("Total price for item: $3")
    expect(page).to have_content("Amount in cart: 3")
    expect(page).to have_content("Total Cost for Cart: $5")
  end

  it 'can empty cart' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id)
    item_2 = create(:item, user_id: merchant_1.id)

    visit items_path

    within "#item-#{item_1.id}" do
      click_on "Add To Cart"
    end

    within "#item-#{item_1.id}" do
      click_on "Add To Cart"

    end

    within "#item-#{item_1.id}" do
      click_on "Add To Cart"
    end

    within "#item-#{item_2.id}" do
      click_on "Add To Cart"
    end

    click_on "Cart Items"
    expect(current_path).to eq("/cart")

    click_on "Empty Cart"
    expect(current_path).to eq("/cart")

    expect(page).to_not have_content("#{item_1.name}")
    expect(page).to have_content("Cart Items: 0")
  end

  it 'can add items from cart' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id)

    visit items_path

    click_on "Add To Cart"
    click_on "Cart Items"

    expect(page).to have_content("Amount in cart: 1")
    click_on "Add Another To Your Cart"

    expect(page).to have_content("Amount in cart: 2")


    click_on "Take One Out Of Your Cart"
    expect(page).to have_content("Amount in cart: 1")
    
    expect(current_path).to eq("/cart")
  end
end
