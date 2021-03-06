require('client')
require('stylist')
require('pry')
require('pg')
require('rspec')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec('DELETE FROM clients *;')
    DB.exec('DELETE FROM stylists *;')
  end
  config.after(:each) do
    DB.exec('DELETE FROM clients *;')
    DB.exec('DELETE FROM stylists *;')
  end
end
