class AddColumnToInvoice < ActiveRecord::Migration[7.1]
  def change
    add_column :invoices, :shipping_charge, :decimal
    add_column :invoices, :tax, :decimal
  end
end
