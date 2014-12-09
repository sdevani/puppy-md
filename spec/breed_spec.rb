require_relative "./spec_helper.rb"

describe BreedRepo do
  describe ".set_breed_price" do
    it "returns an instance of breed" do
      result = BreedRepo.set_breed_price("Terrier", 500)
      expect(result).to be_a(Breed)
    end

    it "has the proper name and price" do
      result = BreedRepo.set_breed_price("Terrier", 500)
      expect(result.name).to eq("Terrier")
      expect(result.price).to eq(500)
    end
  end
end