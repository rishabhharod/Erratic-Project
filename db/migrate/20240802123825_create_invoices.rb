class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.decimal :total_amount
      t.decimal :discount
      t.string :payment_mode

      t.timestamps
    end
  end
end
