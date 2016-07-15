class Client
  attr_reader(:id, :name, :gender, :phone_number)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @phone_number = attributes.fetch(:phone_number)
  end
end
