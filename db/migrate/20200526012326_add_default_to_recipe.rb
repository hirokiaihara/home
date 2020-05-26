class AddDefaultToRecipe < ActiveRecord::Migration[5.0]
  def change
    change_column_null :recipes, :category, false
  end
end
