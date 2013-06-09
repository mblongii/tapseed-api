class Storyboard < ActiveRecord::Base
  has_many :sketches
  has_many :designers
  validates :name, presence: true
  validates :designer_id, presence: true
  after_save :add_designer

private
  def add_designer
    @designer = Designer.find_by(id: self.designer_id)
    @designer.storyboard_id = self.id
    @designer.save
  end
end
