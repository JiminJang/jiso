class Compliment < ActiveRecord::Base
    self.per_page = 5
    resourcify
    include Authority::Abilities
    belongs_to :user
end
