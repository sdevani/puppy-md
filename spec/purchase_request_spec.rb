require_relative 'spec_helper.rb'

describe PurchaseRequestRepo do
  describe ".create" do
    it "creates a purchase request" do
      result = PurchaseRequestRepo.create('Bob', 'Terrier')
      expect(result).to be_a(PurchaseRequest)
    end
  end
  describe ".get" do
    it "gets the request purchase request" do
      PurchaseRequestRepo.create('Bob', 'Terrier')
      result = PurchaseRequestRepo.get('Bob')
      expect(result.customer_name).to eq('Bob')
      expect(result.breed).to eq('Terrier')
    end
  end
end