class Client
  attr_reader(:id, :name, :gender, :phone_number, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @phone_number = attributes.fetch(:phone_number)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:==) do |another_client|
    self.id().==(another_client.id()).&(self.name().==(another_client.name())).&(self.gender().==(another_client.gender())).&(self.phone_number().==(another_client.phone_number())).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients ORDER BY name ASC")
    clients = []
    returned_clients.each() do |client|
      id = client.fetch("id").to_i()
      name = client.fetch("name")
      gender = client.fetch("gender")
      phone_number = client.fetch("phone_number")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:id => id, :name => name, :gender => gender, :phone_number => phone_number, :stylist_id => stylist_id}))
    end
    clients
  end
end
