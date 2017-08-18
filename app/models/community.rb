class Community < ActiveRecord::Base
    self.per_page = 15
    resourcify
    include Authority::Abilities
    has_many :comcoms
    belongs_to :user
    mount_uploader :image, ImguploaderUploader
    def self.search(search)
        where('title LIKE ? OR content  LIKE ?',"%#{search}%","%#{search}%")

    end
    
end
