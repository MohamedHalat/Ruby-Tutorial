class Micropost < ApplicationRecord
    validates :content, length: {minimum:0, maximum:100}, presence: true
    validates :user, presence: true
    validate :picture_size
    default_scope -> { order(created_at: :desc) }
    belongs_to :user
    mount_uploader :picture, PictureUploader

    private

    def picture_size
        if picture.size > 5.megabytes
            errors.add(:picture, "should be less than 5MB")
        end
    end
end
