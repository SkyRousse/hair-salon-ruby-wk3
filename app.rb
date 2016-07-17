require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('./lib/client')
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists/new') do
  erb(:add_stylist_form)
end

post('/stylists') do
  name = params.fetch("name")
  specialty = params.fetch('specialty')
  stylist = Stylist.new({:id => nil, :name => name, :specialty => specialty})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end

post('/clients') do
  stylist_id = params.fetch('stylist_id').to_i()
  name = params.fetch('name')
  gender = params.fetch('gender')
  phone_number = params.fetch('phone_number')
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :gender => gender, :phone_number => phone_number, :stylist_id => stylist_id})
  @client.save()
  erb(:stylist)
end
