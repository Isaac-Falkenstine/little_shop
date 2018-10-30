require 'rails_helper'

describe 'user sees can go into an item show page' do
  it 'can navigate to item show page' do
    item_1 = create(:item)

    visit item_path(item_1)
    expect(current_path).to eq(item_path(item_1))
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.description)
    # expect(page).to have_content("Inventory: #{item_1.inventory}")
  end
end
