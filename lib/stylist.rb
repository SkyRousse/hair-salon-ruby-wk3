class Stylist
  attr_reader(:id, :name, :specialty)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  define_method(:==) do |another_stylist|
    self.id().==(another_stylist.id()).&(self.name().==(another_stylist.name())).&(self.specialty().==(another_stylist.specialty()))
  end

  define_singleton_method(:all) do
    stylists = []
    returned_stylists = DB.exec("SELECT * FROM stylists ORDER BY name ASC;")
    returned_stylists.each() do |stylist|
      id = stylist.fetch("id").to_i()
      name = stylist.fetch("name")
      specialty = stylist.fetch("specialty")
      stylists.push(Stylist.new({:id => id, :name => name, :specialty => specialty}))
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().eql?(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:clients) do
    stylists_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      id = client.fetch("id")
      name = client.fetch("name")
      gender = client.fetch("gender")
      phone_number = client.fetch("phone_number")
      stylist_id = client.fetch("stylist_id").to_i()
      stylists_clients.push(Client.new({:id => id, :name => name, :gender => gender, :phone_number => phone_number, :stylist_id => stylist_id}))
    end
    stylists_clients
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @specialty = attributes.fetch(:specialty, @specialty)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
    DB.exec("UPDATE stylists SET specialty = '#{@specialty}' WHERE id = #{@id};")
  end

  define_method(:remove) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
    DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id()};")
  end
end
