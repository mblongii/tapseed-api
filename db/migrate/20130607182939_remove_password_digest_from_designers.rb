class RemovePasswordDigestFromDesigners < ActiveRecord::Migration
  def change
    remove_column :designers, :password_digest
  end
end
