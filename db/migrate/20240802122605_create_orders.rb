class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :contact
      t.string :payment_status
      t.string :total_amount
      t.string :status
      t.string :tracking_no

      t.timestamps
    end
  end
end
