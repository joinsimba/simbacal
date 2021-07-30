class AddAccountToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :account, index: true, null: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
