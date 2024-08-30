class AddColumnToOrder < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :address, null: true, foreign_key: true
  end
end
