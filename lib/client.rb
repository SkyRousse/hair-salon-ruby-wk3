class Client
  attr_reader(:id, :name, :gender, :phone_number)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @phone_number = attributes.fetch(:phone_number)
  end

  define_method(:==) do |another_client|
    self.id().==(another_client.id()).&(self.name().==(another_client.name())).&(self.gender().==(another_client.gender())).&(self.phone_number().==(another_client.phone_number()))
  end
end
