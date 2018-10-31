require 'rails_helper'

RSpec.describe 'basic cart function' do
  it 'visitor can add and view cart items' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id, inventory: 80)
    item_2 = create(:item, user_id: merchant_1.id, inventory: 80)

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
    expect(current_path).to eq(cart_path)

    expect(page).to have_content("#{item_1.name}")
    expect(page).to have_content("Item price: $#{item_1.price}")
    expect(page).to have_content("#{merchant_1.first_name} #{merchant_1.last_name}")
    expect(page).to have_content("Total price for item: $3")
    expect(page).to have_content("Amount in cart: 3")
    expect(page).to have_content("Total Cost for Cart: $5")
  end

  it 'visitor can empty cart' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id, inventory: 80)
    item_2 = create(:item, user_id: merchant_1.id, inventory: 80)

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
    expect(current_path).to eq(cart_path)

    click_on "Empty Cart"
    expect(current_path).to eq(cart_path)

    expect(page).to_not have_content("#{item_1.name}")
    expect(page).to have_content("Cart Items: 0")
  end

  it 'visitor can add items from cart' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id, inventory: 80)

    visit items_path

    click_on "Add To Cart"
    click_on "Cart Items"

    expect(page).to have_content("Amount in cart: 1")
    click_on "Add Another To Your Cart"

    expect(page).to have_content("Amount in cart: 2")

    expect(current_path).to eq(cart_path)
  end

  it 'visitor can subtract items from cart' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id, inventory: 80)

    visit items_path

    click_on "Add To Cart"
    click_on "Add To Cart"
    click_on "Cart Items"

    click_on "Take One Out Of Your Cart"
    expect(page).to have_content("Amount in cart: 1")

    expect(current_path).to eq(cart_path)
  end

  it 'visitor can subtract items from cart with restrictions' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id, inventory: 30)
    item_2 = merchant_1.items.create(name: "Glove", description: "You can catch stuff with it!", price: 20.00, inventory: 1, thumbnail: "img.jpeg")

    visit items_path

    within "#item-#{item_1.id}" do
      click_on "Add To Cart"
    end

    within "#item-#{item_2.id}" do
      click_on "Add To Cart"
    end

    click_on "Cart Items"

    within "#item-#{item_1.id}" do
      click_on "Take One Out Of Your Cart"
    end

    expect(page).to_not have_content("Item price: $#{item_1.price}")

    expect(current_path).to eq(cart_path)
  end

  it 'visitor can add items from cart with restrictions' do
    merchant_1 = create(:merchant)
    item_1 = create(:item, user_id: merchant_1.id, inventory: 30)
    item_2 = merchant_1.items.create(name: "Glove", description: "You can catch stuff with it!", price: 20.00, inventory: 1, thumbnail: "img.jpeg")

    visit items_path

    within "#item-#{item_1.id}" do
      click_on "Add To Cart"
    end

    within "#item-#{item_2.id}" do
      click_on "Add To Cart"
    end

    click_on "Cart Items"

    within "#item-#{item_2.id}" do
      click_on "Add Another To Your Cart"
    end

    expect(page).to have_content("You already have all the #{item_2.name}s in stock!")
    expect(page).to have_content("Amount in cart: 1")

    expect(current_path).to eq(cart_path)
  end

  describe 'visitory cannot place an order' do
    it 'notifies they must register or login and redirects to registration' do
      merchant_1 = create(:merchant)
      item_1 = create(:item, user_id: merchant_1.id, inventory: 30)
      item_2 = merchant_1.items.create(name: "Glove", description: "You can catch stuff with it!", price: 20.00, inventory: 1, thumbnail: "img.jpeg")

      visit items_path

      within "#item-#{item_1.id}" do
        click_on "Add To Cart"
      end

      within "#item-#{item_2.id}" do
        click_on "Add To Cart"
      end

      click_on "Cart Items"
      click_on "Check Out"

      expect(page).to have_content("You must register or login to checkout.")
      expect(current_path).to eq(new_user_path)
    end
  end


end
