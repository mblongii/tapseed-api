class AddViewingStoryboardIdToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :viewing_storyboard_id, :integer
  end
end
