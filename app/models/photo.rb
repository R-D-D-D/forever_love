class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :event
  validate :image_file_type

  private

  # Validates that the image is of the correct file type
  def image_file_type
    if image.attached? && !image.content_type.in?(%w[image/png image/jpeg image/gif])
      image.purge # delete the uploaded image
      errors.add(:image, 'must be a PNG, JPEG, or GIF file.')
    end
  end
end
