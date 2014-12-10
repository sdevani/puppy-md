# we initialize the module here to use in our other files
module PuppyBreeder
end

require 'pg'

require_relative 'puppy_breeder/puppy.rb'
require_relative 'puppy_breeder/purchase_request.rb'
require_relative 'puppy_breeder/breed.rb'
require_relative 'puppy_breeder/repo/breed_repo.rb'