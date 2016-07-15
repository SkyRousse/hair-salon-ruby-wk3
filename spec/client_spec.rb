require('helper_spec')

describe(Client) do
  describe('#name') do
    it('returns the name of the client') do
      test_client = Client.new({:id => 2, :name => "Eelin", :gender => "Female", :phone_number => 503-345-7898})
      expect(test_client.name()).to(eq("Eelin"))
    end
  end
end
