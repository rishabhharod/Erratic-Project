class CreateSellers < ActiveRecord::Migration[7.1]
  def change
    create_table :sellers do |t|
      t.string :company_email
      t.string :GSTIN_number
      t.string :contact
      t.string :category

      t.timestamps
    end
  end
end
