class Event < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_one_attached :thumbnail
  validates :name, presence: true
end
