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
    it('returns a Stylist object by its id') do
      test_stylist2 = Stylist.new({:id => nil, :name => "Alexis", :specialty => "Esthetician"}).save()
      expect(test_stylist2).to(be_an_instance_of(Fixnum))
    end
  end
end
