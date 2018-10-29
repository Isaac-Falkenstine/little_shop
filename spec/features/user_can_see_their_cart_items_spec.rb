require 'rails_helper'

RSpec.describe 'basic cart function' do
  it 'can add items to cart' do
    merchant = create(:merchant)
    item_1 = create(:item)
    item_2 = create(:item)

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
    expect(page).to have_content("#{merchant_1.name}")
    expect(page).to have_content("6") #Total price for a item
    expect(page).to have_content("3") #Amount of a item in cart
    expect(page).to have_content("10") #Total for everyhting in cart

    # save_and_open_page
  end
end
