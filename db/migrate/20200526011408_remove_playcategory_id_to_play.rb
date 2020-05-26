class RemovePlaycategoryIdToPlay < ActiveRecord::Migration[5.0]
  def change
    remove_column :plays, :playcategory_id, :string
  end
end
