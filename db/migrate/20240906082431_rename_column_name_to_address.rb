class RenameColumnNameToAddress < ActiveRecord::Migration[7.1]
  def change
    rename_column :addresses, :isChecked, :is_checked
  end
end
