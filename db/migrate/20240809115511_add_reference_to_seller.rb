class AddReferenceToSeller < ActiveRecord::Migration[7.1]
  def change
    add_reference :sellers, :user, null: false, foreign_key: true
  end
end
