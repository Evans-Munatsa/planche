class AddUserIdToPost < ActiveRecord::Migration[5.0]
  def up
    add_column :posts, :user_id, :integer
  end

  def down
  end
end