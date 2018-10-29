require 'rails_helper'

describe 'user sees can go into an item show page' do
  it 'can navigate to item show page' do
    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)

    visit item_path(item_1)
    expect(current_path).to eq(item_path(item_1))
    expect(page).to have_content(item_1.name)
  end
end
