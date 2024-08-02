class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.text :full_address
      t.string :state
      t.string :city
      t.integer :pincode
      t.text :landmark

      t.timestamps
    end
  end
end
