class CreateRecipecomments < ActiveRecord::Migration[5.0]
  def change
    create_table :recipecomments do |t|
      t.text          :comment,      null: false
      t.references    :recipe,        foreign_key: true
      t.references    :user,          foreign_key: true
      t.timestamps
    end
  end
end
