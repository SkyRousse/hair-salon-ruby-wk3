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
