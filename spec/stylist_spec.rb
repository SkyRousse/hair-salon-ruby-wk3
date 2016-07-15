require('helper_spec')

describe(Stylist) do
  describe('#name') do
    it('returns the name of the stylist') do
      test_stylist = Stylist.new({:name => "Grace", :specialty => "Cosmetologist"})
      expect(test_stylist.name()).to(eq("Grace"))
    end
  end


end
