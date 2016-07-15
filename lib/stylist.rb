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
    Stylists.all().each() do |stylist|
      if stylist.id().eql(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

end
