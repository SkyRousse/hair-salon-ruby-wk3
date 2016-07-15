class Client
  attr_reader(:name, :gender, :phone_number, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @phone_number = attributes.fetch(:phone_number)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.gender().==(another_client.gender())).&(self.phone_number().==(another_client.phone_number())).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients ORDER BY name ASC")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      gender = client.fetch("gender")
      phone_number = client.fetch("phone_number").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:name => name, :gender => gender, :phone_number => phone_number, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, gender, phone_number, stylist_id) VALUES ('#{@name}', '#{@gender}', #{@phone_number}, #{@stylist_id});")
  end
end
