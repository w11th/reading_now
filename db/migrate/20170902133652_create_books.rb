class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :isbn10, index: true
      t.string :isbn13, index: true
      t.string :title, index: true, null: false
      t.string :subtitle
      t.string :image
      t.string :publisher, index: true
      t.date :publish_date, index: true
      t.integer :pages
      t.integer :douban_id
      t.text :summary

      t.timestamps
    end
  end
end
