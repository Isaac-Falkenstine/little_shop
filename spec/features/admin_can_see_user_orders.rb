require 'rails_helper'

RSpec.describe 'when logged in as an admin' do
  before(:each) do

    @user = User.create(first_name: "default", last_name: "User", street_address: "1234 Sales St.",
            city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "default@email.com", password: "pass123", role: 0)

    @merchant = User.create(first_name: "Merchant", last_name: "User", street_address: "1234 Sales St.",
                city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "merchant@email.com", password: "pass123", role: 1)

    @admin = User.create(first_name: "Admin", last_name: "User", street_address: "1234 Boss St.",
             city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "admin@email.com", password: "pass123", role: 2)

    item_1 = @merchant.items.create(name: "Baseball", description: "You can hit it!", price: 2.00, inventory: 45, thumbnail: "https://vignette.wikia.nocookie.net/harrypotter/images/7/79/Kreacher.img.jpg/revision/latest?cb=20090814153229")
    item_2 = @merchant.items.create(name: "Bat", description: "You can hit stuff with it!", price: 5.00, inventory: 28, thumbnail: "https://images.pigeonsandplanes.com/images/c_limit,f_auto,fl_lossy,q_auto,w_1100/idynbahcpfwsrffsug8f/migos-press-david-rams")

    visit login_path

    fill_in :email_address, with: @user.email_address
    fill_in :password, with: @user.password
    click_on 'Login To The Pub'

    @order_1 = @user.orders.create!(status: 0)
    @order_2 = @user.orders.create!(status: 0)
    OrderItem.create!(item_id: item_1.id, order_id: @order_1.id, amount: item_1.price, count: 2)
    OrderItem.create!(item_id: item_2.id, order_id: @order_2.id, amount: item_1.price, count: 5)

    click_on 'Logout'

  end
  it 'shows orders for selected user' do
    visit login_path

    fill_in :email_address, with: @admin.email_address
    fill_in :password, with: @admin.password
    click_on 'Login To The Pub'
    visit users_path
    click_on "#{@user.email_address}"
    click_on "See User's Orders"

    expect(page).to have_content("#{@order_1.id}")
    expect(page).to have_content("#{@order_1.created_at}")
    expect(page).to have_content("#{@order_1.updated_at}")
    expect(page).to have_content("#{@order_2.id}")
    expect(page).to have_content("#{@order_2.created_at}")
    expect(page).to have_content("#{@order_2.updated_at}")
  end

end
