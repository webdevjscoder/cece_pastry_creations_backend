class AddCurrentCartToTable < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :current_cart, :boolean, default: false
  end
end
