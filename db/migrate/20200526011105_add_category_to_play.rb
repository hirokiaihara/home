class AddCategoryToPlay < ActiveRecord::Migration[5.0]
  def change
    add_column :plays, :category, :string
  end
end
