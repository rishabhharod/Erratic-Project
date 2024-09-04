class ChangeColumnTypeFromAddress < ActiveRecord::Migration[7.1]
  def up 
    change_column :addresses, :address_type, :string
  end
  def down
    change_column :addresses, :type, :string
  end
end
