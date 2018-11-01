![Logo of the project](https://amp.businessinsider.com/images/55df4f819dd7cc10008b6723-750-563.jpg)

# Pub Shop
> Where you can buy everything you need for a good time!

This website has a variety of beers and foods on display, which you can add to your
cart, and then make a order! When you make a account you can change your
personal information and make a cart of items which you can use to create a order.
But be carful, when you log out your cart is emptied.

As a registered merchant you can add items that you'd like to sell, you can edit
those items and enable/disable them if you'd like to stop selling them.

If you're lucky enough to become a registered site admin, you can upgrade users
to merchants, you can ban users from using the site, and you can see all of a
merchant's items, edit them, and add new items for a merchant.

## Installing / Getting started

If you'd like to use this site, all you need to do it find a place you'd like to
store it on your computer, and then clone it onto your computer. Once it's cloned
and you've entered into the project, you should run 'bundle install' and 'bundle update'
and then all you need to do is run 'rails s' in your command line and then visit
the site 'localhost:3000' and you should be all good to go!

## Site Roles

The site accomodates different levels of access depending on your account type.

Visitor
A visitor can browse shop items and add them to their cart without logging in.

Registered User
A visitor wanting to purchase anything from the store must register. To do so they will 
enter basic personal information, an email address, and a password. Their email address
serves as their username. No one at the Pub Shop can read their password - it is encrypted
using the latest methods. (A user may change their password by contacting an administrator.)
Users may examine the details of their past orders.

Merchant
A registered merchant may purchase from the site and access orders they have made as use can. 
They access the site via their login and has the same password security as a registered user. 
They may also sell items on the site by entering item information. They can also examine orders 
that include items they sell.

Administrator
An admin may purchase from the site and has the same password security as other users. They 
may also upgrade and downgrade the status of users and merchants, and examine their profiles and 
orders.

## Under The Hood

The Pub Shop is written in Rails 5.1.6 and Ruby 2.4.1 using a Postgresql database. The program's
front end uses Bootstrap formatting and buttons. The program was written by Melvin Cedeno, Silvestre
Cueller, Isaac Falkenstine, and Norm Schultz.
