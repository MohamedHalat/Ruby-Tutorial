class Micropost < ApplicationRecord
    validates :content, length: {minimum:0, maximum:100}, presence: true
    validates :user, presence: true

    belongs_to :user
end
