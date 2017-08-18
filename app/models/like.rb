class Like < ActiveRecord::Base
    belongs_to :community
    belongs_to :alba
    belongs_to :tippost
    belongs_to :user
    validates_uniqueness_of :user_id, scope: :post_id
    mount_uploader :image, ImguploaderUploader
end
