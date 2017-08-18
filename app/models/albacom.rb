class Albacom < ActiveRecord::Base
    resourcify
    include Authority::Abilities
    belongs_to :alba
     belongs_to :user
end
