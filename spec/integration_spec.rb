require('helper_spec')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("view hair stylist path", {:type => :feature}) do
  it('shows the user the list of hair stylists in the database') do
  visit('/')
  expect(page).to have_content("Oh snap! there aren't any stylists in the database")
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
    fill_in('name', :with => "Grace")
    fill_in('specialty', :with => "Cosmetologist")
    click_button('Add Stylist')
    expect(page).to have_content("Grace Cosmetologist")
  end
end

describe("remove stylist path", {:type => :feature}) do
  it('allows user to remove a stylist from the database') do
    test_stylist = Stylist.new({:id => nil, :name => 'Grace', :specialty => "Cosmetologist"})
    test_stylist.save()
    visit('/')
    expect(page).to have_content("Grace Cosmetologist")
    click_button('X')
    expect(page).to have_content("Oh snap! there aren't any stylists in the database")
  end
end

describe('update stylist path', {:type => :feature}) do
  it('allows user to update the name or specialty of the stylist') do
    test_stylist = Stylist.new({:id => nil, :name => 'Grace', :specialty => "Cosmetologist"})
    test_stylist.save()
    visit('/')
    click_link('Grace')
    fill_in('stylist_name', :with => "Janet")
    fill_in('specialty', :with => "Shaving Heads")
    click_button('Update')
    expect(page).to have_content("Janet Shaving Heads")
  end
end

describe('view clients path', {:type => :feature}) do
  it('shows the user the clients that a specific hair stylist has') do
    test_stylist = Stylist.new({:id => nil, :name => 'Grace', :specialty => "Cosmetologist"})
    test_stylist.save()
    visit('/')
    click_link("#{test_stylist.name()}")
    expect(page).to have_content("Oh snap! this stylist doesn't have any clients yet")
    test_client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => test_stylist.id()})
    test_client.save()
    visit("/stylists/#{test_stylist.id()}/edit")
    expect(page).to have_content('Eelin')
  end
end

describe('add client to a specific stylist path', {:type => :feature}) do
  it('allows a user to create a new client for a specific stylist') do
    test_stylist = Stylist.new({:id => nil, :name => 'Grace', :specialty => "Cosmetologist"})
    test_stylist.save()
    visit("/stylists/#{test_stylist.id()}/edit")
    fill_in('client_name', :with => 'Daria')
    fill_in('gender', :with => 'Female')
    fill_in('phone_number', :with => "5059999999")
    click_button('Add Client')
    expect(page).to have_content('Daria')
  end
end

describe("remove client path", {:type => :feature}) do
  it('allow a user to remove a client from the database') do
    test_stylist = Stylist.new({:id => nil, :name => 'Grace', :specialty => "Cosmetologist"})
    test_stylist.save()
    visit("/stylists/#{test_stylist.id()}/edit")
    fill_in('client_name', :with => 'Daria')
    fill_in('gender', :with => 'Female')
    fill_in('phone_number', :with => "5059999999")
    click_button('Add Client')
    expect(page).to have_content('Daria')
    click_button('X')
    expect(page).to have_content("Oh snap! this stylist doesn't have any clients yet")
  end
end
