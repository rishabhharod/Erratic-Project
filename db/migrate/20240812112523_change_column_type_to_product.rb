class ChangeColumnTypeToProduct < ActiveRecord::Migration[7.1]
  def up 
    change_column :products, :product_type, :string
  end
  def down
    change_column :products, :type, :string
  end
end
