class RemoveColumnTypeFromProduct < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :type, :string
  end
end
