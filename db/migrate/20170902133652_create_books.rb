class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :isbn10
      t.string :isbn13
      t.string :title
      t.string :subtitle
      t.string :image
      t.string :publisher
      t.date :publish_date
      t.integer :pages
      t.integer :douban_id
      t.text :summary

      t.timestamps
    end
  end
end
