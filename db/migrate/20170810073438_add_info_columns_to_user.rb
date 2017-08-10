class AddInfoColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      t.column :nickname, :string, limit: 60
      t.column :avatar, :string
      t.column :intro, :string, limit: 255
    end
  end
end
