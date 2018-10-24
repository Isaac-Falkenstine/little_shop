require 'rails_helper'

describe 'user sees items page' do
  it 'when visiting the page' do
    item_1 = Item.create(name: "thing1", description: "this beer is delicious", price: 5.99, thumbnail: "go here", inventory: 10)
    item_2 = Item.create(name: "thing2", description: "this shepherds pie is delicious", price: 4.99, thumbnail: "go here", inventory: 20)

    visit items_path
    expect(page).to have_content("Item")
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
  end
end
