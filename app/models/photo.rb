class Photo < ActiveRecord::Base
  belongs_to :place
  belongs_to :user

  mount_uploader :picture, PictureUploader
  validates :caption, presence: true, length: { maximum: 20}
  validates :picture, presence: true
end
