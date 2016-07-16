require('helper_spec')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("view hair stylist path", {:type => :feature}) do
  it('shows the user the list of hair stylists in the database') do
  visit('/')
  expect(page).to have_content("Oh snap! there aren't any stylists in the database yet")
  test_stylist = Stylist.new({:id => nil, :name => 'Grace', :specialty => "Cosmetologist"})
  test_stylist.save()
  visit('/')
  expect(page).to have_content(test_stylist.name())
  end
end

describe("add stylist path", {:type => :feature}) do
  it('allows user to add a new stylist', {:type => :feature}) do
    visit('/')
    click_link("Start Adding Stylists")
    visit('/stylists/new')
    fill_in('name', :with => "Grace")
    fill_in('specialty', :with => "Cosmetologist")
    click_button('Add Stylist')
    expect(page).to have_content("Grace Cosmetologist")
  end
end

describe('view clients path', {:type => :feature}) do
  it('show the user the clients that a specific hair stylist has') do
    test_stylist = Stylist.new({:id => nil, :name => 'Grace', :specialty => "Cosmetologist"})
    test_stylist.save()
    visit("/stylists/#{test_stylist.id()}")
    expect(page)to have_content("Grace")
    client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => 503-345-7898, :stylist_id => test_stylist.id()})
    client.save()
    visit("/stylists/#{test_stylist.id()}")
    expect(page).to have_content('Eelin')
  end
end
