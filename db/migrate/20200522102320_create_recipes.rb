class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_title,      null: false
      t.string :recipe_image,      null: false
      t.text   :recipe_introduction, null: false
      t.integer :recipecategory_id, null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
