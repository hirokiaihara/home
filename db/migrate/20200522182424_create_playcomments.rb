class CreatePlaycomments < ActiveRecord::Migration[5.0]
  def change
    create_table :playcomments do |t|
      t.text        :comment,    null: false
      t.references  :play,   foreign_key: true
      t.references  :user,   foreign_key: true
      t.timestamps
    end
  end
end
