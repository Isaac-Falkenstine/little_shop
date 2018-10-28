require 'rails_helper'

feature "when a user is logged in" do
  scenario "" do

    user = User.create(first_name: "Merchant", last_name: "User", street_address: "1234 Sales St.",
                          city: "Lone Tree", state: "Colorado", zip: 81234, email_address: "merchant@email.com", password: "pass123", role: 1)
    user.items.create(name: "Baseball", description: "You can hit it!", price: 2.00, inventory: 45, thumbnail: "https://vignette.wikia.nocookie.net/harrypotter/images/7/79/Kreacher.img.jpg/revision/latest?cb=20090814153229")
    user.items.create(name: "Bat", description: "You can hit stuff with it!", price: 5.00, inventory: 28, thumbnail: "https://images.pigeonsandplanes.com/images/c_limit,f_auto,fl_lossy,q_auto,w_1100/idynbahcpfwsrffsug8f/migos-press-david-rams")


    visit '/'

    click_on 'Login'

    expect(current_path).to eq(login_path)
    fill_in :email_address, with: user.email_address
    fill_in :password, with: user.password

    click_on 'Login To The Pub'
    expect(current_path).to eq(user_path(user))

    click_on 'Items for Sale'
  end
end
