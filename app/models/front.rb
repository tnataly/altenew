class Front < ActiveRecord::Base
  belongs_to :template
  mount_uploader :image, SvgUploader
end
