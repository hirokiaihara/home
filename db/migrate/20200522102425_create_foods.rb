class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string        :food_name
      t.string        :quantity
      t.references    :recipe,     foreign_key: true
      t.timestamps
    end
  end
end
