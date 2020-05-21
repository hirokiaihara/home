class CreatePlays < ActiveRecord::Migration[5.0]
  def change
    create_table :plays do |t|
      t.string :play_title,      null: false
      t.string :play_image,      null: false
      t.text   :play_introduction, null: false
      t.integer :playcategory_id,   null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
