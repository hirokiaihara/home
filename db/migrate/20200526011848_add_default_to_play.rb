class AddDefaultToPlay < ActiveRecord::Migration[5.0]
  def change
    change_column_null :plays, :category, false
  end
end
