class RenameTableConnectionsColumnInfoIamgeToInfoImage < ActiveRecord::Migration[5.1]
  def change
    rename_column :connections, :info_iamge, :info_image
  end
end
