class Reviewcom < ActiveRecord::Base
  include Authority::Abilities
  resourcify
    belongs_to :review
    belongs_to :user
end
