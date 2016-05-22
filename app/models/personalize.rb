class Personalize < ActiveRecord::Base
  belongs_to :user
  belongs_to :template
end
