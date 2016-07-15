class Stylist
  attr_reader(:id, :name, :specialty)

  define_method(:initialize) do |attributes|
    @id = attributes[id]
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  

end
