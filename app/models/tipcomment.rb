class Tipcomment < ActiveRecord::Base
    resourcify
  include Authority::Abilities

    belongs_to :tippost
    belongs_to :user
end
