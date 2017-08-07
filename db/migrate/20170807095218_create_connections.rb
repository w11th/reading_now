class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.references :user, foreign_key: true
      t.string :info_name, null: false
      t.string :info_iamge

      t.timestamps
    end

    add_index :connections, [:provider, :uid], unique: true
  end
end
