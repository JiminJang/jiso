class Comcom < ActiveRecord::Base
     resourcify
  include Authority::Abilities

     belongs_to :community
     belongs_to :user
    
end
