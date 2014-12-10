require_relative "./spec_helper.rb"

describe BreedRepo do
  let(:repo) {BreedRepo.new}

  before(:each) do
    repo.clear_table
  end

  describe ".set_breed_price" do
    it "returns an instance of breed" do
      result = repo.set_breed_price("Terrier", 500)
      expect(result).to be_a(Breed)
    end

    it "has the proper name and price" do
      result = repo.set_breed_price("Terrier", 500)
      expect(result.name).to eq("Terrier")
      expect(result.price).to eq(500)
    end
  end

  describe ".get_breed" do
    it "returns the name and price of a breed" do
      repo.set_breed_price("Terrier", 500)
      result = repo.get_breed("Terrier")
      expect(result.name).to eq("Terrier")
      expect(result.price).to eq(500)
    end

    it "can update the price of a breed" do
      repo.set_breed_price("Terrier", 1000)
      repo.set_breed_price("Terrier", 500)
      result = repo.get_breed("Terrier")
      expect(result.name).to eq("Terrier")
      expect(result.price).to eq(500)
    end

    it "returns nil when there is no result" do
      result = repo.get_breed("Terrier")
      expect(result).to eq(nil)
    end
  end

end