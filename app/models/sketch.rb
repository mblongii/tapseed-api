class Sketch < ActiveRecord::Base
  include ValidateUrl
  belongs_to :designer
  belongs_to :storyboard
  validates :designer_id, presence: true
  validates :storyboard_id, presence: true
  validates :url, presence: true, uniqueness: true, url: true
end
