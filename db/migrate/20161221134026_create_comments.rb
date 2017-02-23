class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment

      t.integer :post_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end
