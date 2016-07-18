# Hair Salon - Epicodus - Ruby- Wk3 - Independent Project

####  A webapp connected to a Postgres database for a hair salon. The app is designed for an owner to be able to manage the data for stylists and their clients.

#### By Sky Rousse

## Description

 This is the week three independent project for the Ruby class at Epicodus. In this project we are putting to practice our knowledge of working with Postgres and creating one to many relationships between objects using data tables. The objectives are as follows:
* Use of standard naming conventions for database tables and columns.
* Correct set up of a one-to-many relationship.
* Execution of CRUD functionality in class methods and routes.
Use of RESTful routes
* Objects are created from a custom class with custom methods.
* An instance of one class appears in the method of another class.
* Specs have complete coverage for the behaviors that need to be tested.
* Specs are passing.
* Logic is easy to understand.
* Code has proper indentation and spacing.
* Variable names are descriptive.
* Integration specs are passing.
* Sinatra application uses views, instance variables and forms.
* Good Git documentation (regular commits with clear, consistently formatted messages and a complete README).
* Message syntax should complete the sentence "This commit will..."; for example "update image files on the home page".
* README should include application name, author name, description, setup instructions, licensing.

## Setup/Installation Requirements

* Download from github: https://github.com/SkyRousse/hair-salon-ruby-wk3.git
* Open a terminal tab and run $ postgres
* Open another terminal tab and run $ psql
* In the tab running psql create a database with this command: CREATE DATABASE hair-salon;
* Then create the following table with this command: CREATE TABLE clients (id serial PRIMARY KEY, name varchar, gender varchar, phone_number varchar(12) check (cell ~ '^[0-9]+$'), stylist_id int);
* Then create the following table with this command: CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, specialty varchar);
* Open a third terminal tab and run $ app.rb to start Sinatra
* Open local host by typing: http://4567 in a browser

## Known Bugs
No known bugs at this time.


## Support and contact details
If you have questions comments or concerns please reach out to me at:
Sky: <a href="mailto:skyrousse@gmail.com">skyrousse@gmail.com</a>

## Technologies Used

* Ruby
* RSpec
* Sinatra
* Capybara
* Postgres

### License

Licensed under the _MIT_ License

Copyright (c) 2016 **Sky Rousse**
