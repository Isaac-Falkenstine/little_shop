require 'rails_helper'

describe 'user sees can go into an item show page' do
  it 'can navigate to item show page' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id)

    visit item_path(item_1)

    expect(current_path).to eq(item_path(item_1))
    expect(page).to have_content(item_1.name)

    expect(page).to have_content("Description: #{item_1.description}")
    expect(page).to have_content("Inventory: #{item_1.inventory}")
  end

  it 'can add item to cart' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id)

    visit items_path(item_1)

    expect(page).to have_content('Cart Items: 0')
    click_on "Add To Cart"
    expect(page).to have_content('Cart Items: 1')
  end
end
