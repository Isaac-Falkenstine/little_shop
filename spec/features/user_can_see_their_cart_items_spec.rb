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
    save_and_open_page

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
end
