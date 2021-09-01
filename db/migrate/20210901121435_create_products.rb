class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :url
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end