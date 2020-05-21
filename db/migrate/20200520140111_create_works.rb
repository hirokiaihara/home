class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string    :work_image
      t.text      :work_text
      t.references :play,     foreign_key: true
      t.timestamps
    end
  end
end
