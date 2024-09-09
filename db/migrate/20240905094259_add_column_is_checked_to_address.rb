class AddColumnIsCheckedToAddress < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :isChecked, :boolean
  end
end
