class Review < ActiveRecord::Base
    self.per_page = 16
    resourcify
    include Authority::Abilities
    
    has_many :reviewcoms
    belongs_to :user
    mount_uploader :image, ImguploaderUploader
    def self.search(search)
        where('title LIKE ? OR content  LIKE ?',"%#{search}%","%#{search}%")
        #where("content  LIKE ?", "%#{search}%")
    end
end
