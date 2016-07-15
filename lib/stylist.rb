class Stylist
  attr_reader(:id, :name, :specialty)

  define_method(:initialize) do |attributes|
    @id = attributes[id]
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  define_method('==') do |another_stylist|
    self.id().==(another_stylist.id()).&(self.name().==(another_stylist.name())).&(self.specialty().==(another_stylist.specialty()))
  end

end
