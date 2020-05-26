class RemoveRecipecategoryIdToRecipe < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :recipecategory_id, :string
  end
end
