#Refer to this class as PuppyBreeder::PurchaseRequest
#purchase request for customer
#customer will pick breed, need to keep customer's name
# module PuppyBreeder
  class PurchaseRequest
    attr_reader :customer_name, :breed
  
    def initialize(customer_name, breed)
      @customer_name = customer_name
      @breed = breed
    end
  end

  class PurchaseRequestRepo
    @request = Hash.new
  
    def self.create(customer_name, breed)
      pr = PurchaseRequest.new(customer_name, breed)
      @request[customer_name] = pr
    end

    def self.get(customer_name)
      @request[customer_name]
    end
  end
# end