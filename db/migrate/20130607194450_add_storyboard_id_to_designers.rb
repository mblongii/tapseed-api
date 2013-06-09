class AddStoryboardIdToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :storyboard_id, :integer
  end
end
