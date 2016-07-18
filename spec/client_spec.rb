require('helper_spec')

describe(Client) do
  describe('#name') do
    it('returns the name of the client') do
      test_client = Client.new({:id => 2, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
      expect(test_client.name()).to(eq("Eelin"))
    end
  end

  describe('#gender') do
    it('returns the gender of the client') do
    test_client = Client.new({:id => 2, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
    expect(test_client.gender()).to(eq("Female"))
    end
  end

  describe('#phone_number') do
    it('returns the phone_number of the client') do
      test_client = Client.new({:id => 2, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
      expect(test_client.phone_number()).to(eq("5033457898"))
    end
  end

  describe('#stylist_id') do
    it('returns the id of the stylist_id object that this object is connected to') do
      test_client = Client.new({:id => 2, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe('#==') do
    it('compares object attributes to determine if they are the same object') do
      test_client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
      test_client2 = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
      expect(test_client).to(eq(test_client2))
    end
  end

  describe('.all') do
    it('returns an empty array') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a client to the array of saved clients') do
      test_client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#id') do
    it('returns the id of a client object') do
      test_client2 = Client.new({:id => nil, :name => "Maven", :gender => "Male", :phone_number => "5033451982", :stylist_id => 2})
      test_client2.save()
      expect(test_client2.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('returns a Client object by its id') do
      test_client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
      test_client2 = Client.new({:id => nil, :name => "Maven", :gender => "Male", :phone_number => "5033451982", :stylist_id => 2})
      test_client.save()
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe('#update') do
    it('will update the attributes of the client object') do
      test_client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
      test_client.save()
      test_client.update({:name => "Maven", :gender => "Male", :phone_number => "5033451982", :stylist_id => 2})
      expect(test_client.name()).to(eq("Maven"))
    end
  end

  describe('#remove') do
    it('removes the specified client from the database') do
      test_client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => 1})
      test_client.save()
      test_client.remove()
      expect(Client.all()).to(eq([]))
    end
  end
end
