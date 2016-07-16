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
