class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, limit: 2
      t.decimal :total

      t.timestamps
    end
  end
end
