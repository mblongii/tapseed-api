class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :email
      t.string :password_digest
      t.string :avatar_url
      t.string :auth_token

      t.timestamps
    end
  end
end
