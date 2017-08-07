class AddUserIdProviderIndexToConnections < ActiveRecord::Migration[5.1]
  def change
    add_index :connections, [:user_id, :provider], unique: true
  end
end
