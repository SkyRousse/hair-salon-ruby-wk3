class Client
  attr_reader(:id, :name, :gender, :phone_number, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
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
      id = client.fetch("id").to_i()
      name = client.fetch("name")
      gender = client.fetch("gender")
      phone_number = client.fetch("phone_number")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:id => id, :name => name, :gender => gender, :phone_number => phone_number, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, gender, phone_number, stylist_id) VALUES ('#{@name}', '#{@gender}', '#{@phone_number}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all().each() do |client|
      if client.id().eql?(id)
        found_client = client
      end
    end
    found_client
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @gender = attributes.fetch(:gender, @gender)
    @phone_number = attributes.fetch(:phone_number, @phone_number)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
    DB.exec("UPDATE clients SET gender = '#{@gender}' WHERE id = #{@id};")
    DB.exec("UPDATE clients SET phone_number = '#{@name}' WHERE id = #{@id};")
  end
end
