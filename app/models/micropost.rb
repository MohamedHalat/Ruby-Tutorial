class Micropost < ApplicationRecord
    validates :content, length: {minimum:0, maximum:100}, presence: true
    validates :user, presence: true
    default_scope -> { order(created_at: :desc) }
    belongs_to :user
    mount_uploader :picture, PictureUploader
end
