class Template < ActiveRecord::Base
  mount_uploader :cover_image, ImageUploader
  validates :title, :size, :cover_image, presence: true

  paginates_per 1

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
end
