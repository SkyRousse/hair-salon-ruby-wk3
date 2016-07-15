require('helper_spec')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("view hair stylist path", {:type => :feature}) do
  it('shows the user the list of hair stylists in the database') do
  visit('/')
  expect(page).to have_content("There aren't any stylists in the database yet")
  test_stylist = Stylist.new({:id => nil, :name => 'Grace', :specialty => "Cosmetologist"})
  test_stylist.save()
  visit('/')
  expect(page).to have_content(test_stylist.name())
  end
end

describe("add stylist path", {:type => :feature}) do
  it('allows user to add a new stylist', {:type => :feature}) do
    visit('/stylists/new')
    click_link("Add Stylist")
    fill_in('name', :with => "Grace")
    fill_in('specialty', :with => "Cosmetologist")
    click_button('Add Stylist')
    expect(page).to have_content("Grace Cosmetologist")
  end
end
