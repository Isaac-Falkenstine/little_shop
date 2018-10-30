require 'rails_helper'

describe 'user sees enabled items on items page' do
  it 'when visiting the page' do
    merchant_1 = create(:merchant)
    item_1 = merchant_1.items.create(name: "Glove", description: "You can catch stuff with it!", price: 10.00, inventory: 48, thumbnail: "img.jpeg", enabled: false)
    item_2 = merchant_1.items.create(name: "Item 2", description: "You can catch stuff with it!", price: 10.00, inventory: 48, thumbnail: "img.jpeg")


    visit items_path

    expect(item_1.enabled).to eq(false)
    expect(item_2.enabled).to eq(true)
    expect(page).to_not have_content(item_1.name)
    expect(page).to have_content(item_2.name)
  end
end
