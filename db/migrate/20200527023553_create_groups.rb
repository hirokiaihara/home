class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string     :group_name,    null: false
      t.integer    :created_user_id,   null: false
      t.timestamps
    end
  end
end
