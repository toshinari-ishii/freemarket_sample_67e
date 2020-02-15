class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.string :condition, null: false
      t.integer :burden, null: false
      t.string :area, null: false
      t.string :day, null: false
      t.integer :price, null: false
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :buyer, null: true
      t.timestamps
    end
  end
end
