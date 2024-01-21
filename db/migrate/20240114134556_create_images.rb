class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :name
      t.string :alt_text
      t.string :category
      t.timestamps
    end
  end
end
