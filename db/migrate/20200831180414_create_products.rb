class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :image
      t.string :description
      t.integer :rating, :limit => 2

      t.timestamps
    end
  end
end
