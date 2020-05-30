class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id
      t.integer :visited_id
      t.integer :play_id
      t.integer :recipe_id
      t.integer :playcomment_id
      t.integer :recipecomment_id
      t.integer :message_id
      t.integer :group_id
      t.string :action
      t.boolean :checked, default: false
      t.timestamps
    end
  end
end
