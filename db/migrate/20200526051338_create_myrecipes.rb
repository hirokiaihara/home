class CreateMyrecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :myrecipes do |t|
      t.references :user,    foreign_key: true
      t.references :recipe,    foreign_key: true
      t.timestamps
    end
  end
end
