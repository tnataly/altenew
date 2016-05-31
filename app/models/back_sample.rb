class BackSample < ActiveRecord::Base
  belongs_to :template
  mount_uploader :image, ImageUploader

  paginates_per 1
end
