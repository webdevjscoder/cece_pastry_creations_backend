class DropCustomersTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :customers, force: :cascade
  end
end
