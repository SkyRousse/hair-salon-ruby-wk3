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

end
