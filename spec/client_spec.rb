require('helper_spec')

describe(Client) do
  describe('#name') do
    it('returns the name of the client') do
      test_client = Client.new({:id => 2, :name => "Eelin", :gender => "Female", :phone_number => 503-345-7898, :stylist_id => 1})
      expect(test_client.name()).to(eq("Eelin"))
    end
  end

  describe('#gender') do
    it('returns the gender of the client') do
    test_client = Client.new({:id => 2, :name => "Eelin", :gender => "Female", :phone_number => 503-345-7898, :stylist_id => 1})
    expect(test_client.gender()).to(eq("Female"))
    end
  end

  describe('#phone_number') do
    it('returns the phone_number of the client') do
      test_client = Client.new({:id => 2, :name => "Eelin", :gender => "Female", :phone_number => 503-345-7898, :stylist_id => 1})
      expect(test_client.phone_number()).to(eq(503-345-7898))
    end
  end

  describe('#==') do
    it('compares object attributes to determine if they are the same object') do
      test_client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => 503-345-7898, :stylist_id => 1})
      test_client2 = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => 503-345-7898, :stylist_id => 1})
      expect(test_client).to(eq(test_client2))
    end
  end
  # describe('#id') do
  #   it('returns the id of the client')
  # end
end
