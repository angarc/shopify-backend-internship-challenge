class Photo < ApplicationRecord
  has_one_attached :image

  validates_presence_of :image, :title

  belongs_to :user
end
