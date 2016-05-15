class Kit < ActiveRecord::Base
  has_many :templates
  mount_uploader :cover_image, ImageUploader
  validates :title, :cover_image, presence: true

  paginates_per 5

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
end
