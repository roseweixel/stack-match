class Feed < ActiveRecord::Base
  #attr_accessor :search_term, :results
  serialize :results
end
