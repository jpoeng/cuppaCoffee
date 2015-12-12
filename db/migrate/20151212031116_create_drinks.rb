class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :brand
      t.integer :cups

      t.timestamps null: false
    end
  end
end
