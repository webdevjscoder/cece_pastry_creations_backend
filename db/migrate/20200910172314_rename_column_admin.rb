class RenameColumnAdmin < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :admin?, :is_admin
  end
end
