require('helper_spec')

describe(Stylist) do
  describe('#name') do
    it('returns the name of the stylist') do
      test_stylist = Stylist.new({:name => "Grace", :specialty => "Cosmetologist"})
      expect(test_stylist.name()).to(eq("Grace"))
    end
  end

  describe('#specialty') do
    it('returns the specialty of the stylist') do
      test_stylist = Stylist.new({:name => "Grace", :specialty => "Cosmetologist"})
      expect(test_stylist.specialty()).to(eq("Cosmetologist"))
    end
  end

  describe('#==') do
    it('compares the attributes of objects to determine if they are the same') do
      test_stylist = Stylist.new({:name => "Grace", :specialty => "Cosmetologist"})
      test_stylist2 = Stylist.new({:name => "Grace", :specialty => "Cosmetologist"})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe('.all') do
    it('initially returns an empty array') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the object to the database') do
      test_stylist = Stylist.new({:id => nil, :name => "Grace", :specialty => "Cosmetologist"})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#id') do
    it('returns the id of a stylist object') do
      test_stylist2 = Stylist.new({:id => nil, :name => "Alexis", :specialty => "Esthetician"})
      test_stylist2.save()
      expect(test_stylist2.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('returns a Stylist by its id') do
      test_stylist = Stylist.new({:id => nil, :name => "Alexis", :specialty => "Esthetician"})
      test_stylist2 = Stylist.new({:id => nil, :name => "Alexis", :specialty => "Esthetician"})
      test_stylist.save()
      test_stylist2.save()
      expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

  describe('#clients') do
    it('returns an array of clients for a specific stylist') do
      test_stylist = Stylist.new({:id => nil, :name => "Alexis", :specialty => "Esthetician"})
      test_stylist.save()
      test_client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:id => nil, :name => "Maven", :gender => "Male", :phone_number => "5033451982", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe('#update') do
    it('will update the attributes of the stylist object') do
      test_stylist = Stylist.new({:id => nil, :name => "Alexis", :specialty => "Esthetician"})
      test_stylist.save()
      test_stylist.update({:id => nil, :name => "Grace", :specialty => "Cosmetologist"})
      expect(test_stylist.name()).to(eq("Grace"))
    end
  end

  describe('#remove') do
    it('removes the specified stylist from the database') do
      test_stylist = Stylist.new({:id => nil, :name => "Alexis", :specialty => "Esthetician"})
      test_stylist.save()
      test_client = Client.new({:id => nil, :name => "Eelin", :gender => "Female", :phone_number => "5033457898", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:id => nil, :name => "Maven", :gender => "Male", :phone_number => "5033451982", :stylist_id => test_stylist.id()})
      test_client2.save()
      test_stylist.remove()
      expect(Stylist.all()).to(eq([]))
    end
  end
end
