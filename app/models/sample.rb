class Sample < ActiveRecord::Base
  belongs_to :template
  mount_uploader :image, ImageUploader

  paginates_per 6
end