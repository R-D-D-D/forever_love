class Video < ApplicationRecord
  has_one_attached :video
  belongs_to :event

  validate :video_file_type

  private

  # Validates that the video is of the correct file type
  def video_file_type
    if video.attached? && !video.content_type.in?(%w[video/mp4 video/wmv])
      video.purge # delete the uploaded video
      errors.add(:video, 'must be an MP4 or WMV file.')
    end
  end
end
