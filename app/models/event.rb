class Event < ApplicationRecord
  has_many :photos
  has_many :videos
  has_one_attached :thumbnail
  validates :name, presence: true
end
