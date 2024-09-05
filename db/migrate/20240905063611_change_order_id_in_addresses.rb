class ChangeOrderIdInAddresses < ActiveRecord::Migration[7.1]
  def change
    change_column :addresses, :order_id, :integer, null: true
  end
end
