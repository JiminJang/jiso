
class Brand < ActiveRecord::Base
    resourcify
    include Authority::Abilities
    
    belongs_to :user
    mount_uploader :image, ImguploaderUploader
end
