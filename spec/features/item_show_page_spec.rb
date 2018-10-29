require 'rails_helper'

describe 'user sees can go into an item show page' do
  it 'can navigate to item show page' do
    item_1 = create(:item)
    item_2 = create(:item)

    visit items_path

    expect
  end
end
