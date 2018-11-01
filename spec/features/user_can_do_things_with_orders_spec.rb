require 'rails_helper'


RSpec.describe 'user can see orders' do
  it 'current user can see orders' do
    user_1 = User.create(first_name: "default", last_name: "User", street_address: "1234 Sales St.",
    city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "default@email.com", password: "pass123", role: 1)
    merchant = User.create(first_name: "Merchant", last_name: "User", street_address: "1234 Sales St.",
    city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "merchant@email.com", password: "pass123", role: 1)

    item_1 = merchant.items.create(name: "Baseball", description: "You can hit it!", price: 2.00, inventory: 45, thumbnail: "https://vignette.wikia.nocookie.net/harrypotter/images/7/79/Kreacher.img.jpg/revision/latest?cb=20090814153229")
    item_2 = merchant.items.create(name: "Bat", description: "You can hit stuff with it!", price: 5.00, inventory: 28, thumbnail: "https://images.pigeonsandplanes.com/images/c_limit,f_auto,fl_lossy,q_auto,w_1100/idynbahcpfwsrffsug8f/migos-press-david-rams")


    visit items_path

    click_on 'Login'

    fill_in :email_address, with: user_1.email_address
    fill_in :password, with: user_1.password
    click_on 'Login To The Pub'

    order_1 = user_1.orders.create!(status: 0)
    order_2 = user_1.orders.create!(status: 0)

    order_item = OrderItem.create!(item_id: item_1.id, order_id: order_1.id, amount: item_1.price, count: 2)

    visit items_path

    visit profile_orders_path
    expect(page).to have_content("#{order_1.created_at}")
    expect(page).to have_content("#{order_1.updated_at}")
    expect(page).to have_content("Status: pending")
    expect(page).to have_content("Total Quantity Of Items: ")
    expect(page).to have_content("Grand Total Of All Items In Cart: ")
    expect(current_path).to eq(profile_orders_path)
    merchant.percent_sold
  end

    describe "User Adds Items To Cart" do
      it "clicks on check out and is navigated to cart" do
        user_1 = User.create!(first_name: "default", last_name: "User", street_address: "1234 Sales St.",
        city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "default@email.com", password: "pass123", role: 1)
        merchant = User.create(first_name: "Merchant", last_name: "User", street_address: "1234 Sales St.",
        city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "merchant@email.com", password: "pass123", role: 1)

        item_1 = merchant.items.create(name: "Baseball", description: "You can hit it!", price: 2.00, inventory: 45, thumbnail: "https://vignette.wikia.nocookie.net/harrypotter/images/7/79/Kreacher.img.jpg/revision/latest?cb=20090814153229")
        item_2 = merchant.items.create(name: "Bat", description: "You can hit stuff with it!", price: 5.00, inventory: 28, thumbnail: "https://images.pigeonsandplanes.com/images/c_limit,f_auto,fl_lossy,q_auto,w_1100/idynbahcpfwsrffsug8f/migos-press-david-rams")

        order_1 = user_1.orders.create!(status: 0)
        order_2 = user_1.orders.create!(status: 0)


        visit login_path

        fill_in :email_address, with: user_1.email_address
        fill_in :password, with: "pass123"
        click_on 'Login To The Pub'
        click_on "Items for Sale"
        within "#item-#{item_1.id}" do
        click_on "Add To Cart"
        end

        click_on "Cart Items"
        expect(current_path).to eq(cart_path)

        expect(OrderItem.all).to be_empty

        click_on "Check Out"
        expect(OrderItem.first).to_not be_nil
        expect(current_path).to eq(profile_orders_path)
        expect(page).to have_content("#{order_1.id}")

    end
  end
end
