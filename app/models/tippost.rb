class Tippost < ActiveRecord::Base
    self.per_page = 15
 resourcify
  include Authority::Abilities

    has_many :tipcomments
    belongs_to :user
    belongs_to :category

    mount_uploader :image, ImguploaderUploader
    def self.search(search)
        where('title LIKE ? OR content  LIKE ?',"%#{search}%","%#{search}%")
        #where("content  LIKE ?", "%#{search}%")
    end
end
