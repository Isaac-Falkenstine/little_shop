require 'rails_helper'

RSpec.describe 'basic cart function' do
  it 'can add itemns to cart' do
    item_1 = create(:item)
    item_2 = create(:item)
    
    visit items_path
    
    expect(page).to have_content('Cart Items: 0')
    within "#item-#{item_1.id}" do
      click_on "Add To Cart"
    end
    expect(page).to have_content('Cart Items: 1')
   
    within "#item-#{item_1.id}" do
      click_on "Add To Cart"

    end
    expect(page).to have_content('Cart Items: 2')

    within "#item-#{item_2.id}" do
      click_on "Add To Cart"

    end
    expect(page).to have_content('Cart Items: 3')



  end
end