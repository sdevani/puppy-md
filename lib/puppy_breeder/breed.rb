class Breed
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class BreedRepo
  def self.set_breed_price(breed_name, price)
    return Breed.new(breed_name, price)
  end
end
