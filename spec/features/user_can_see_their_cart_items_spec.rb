require 'rails_helper'

RSpec.describe 'basic cart function' do
  it 'can add items to cart' do
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
    expect(page).to have_content("#{item_1.price}")
    expect(page).to have_content("#{merchant_1.first_name} #{merchant_1.last_name}")
    expect(page).to have_content("1") #Price for a item
    expect(page).to have_content("Total price for item: 3") #Total price for a item
    expect(page).to have_content("Amount in cart: 3") #Amount of a item in cart
    expect(page).to have_content("Total Cost: 5") #Total for everyhting in cart

    # save_and_open_page
  end
end
