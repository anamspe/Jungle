# Jungle

A mini e-commerce application built with Rails.

## Final Product

![Jungle Product](https://github.com/anamspe/Jungle/blob/master/docs/Jungle-product1.png?raw=true)

![Jungle Cart](https://github.com/anamspe/Jungle/blob/master/docs/Jungle-cart.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Functionalities
* Navigate through the website to see a variety of products offered
* Click on any product to see its details in a specific page
* Visit our 'About Us' page to learn more about Jungle's story
* Admin functionalities: Available only by admin user authentication
  * List Categories and Products
  * Add new categories
  * Add new products
  * Delete products

## Notes
* Jungle allows you to Login and/or Sign Up in any page of the website
* Jungle will show when a given product is sold out and it won't be possible to add it to the cart


## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
