class AddColumnTypeToAddress < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :type, :string
  end
end
