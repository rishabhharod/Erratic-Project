class RemoveColumnFromAddress < ActiveRecord::Migration[7.1]
  def change
    remove_column :addresses, :type, :string
  end
end
