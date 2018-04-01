class CreateBookDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :book_details do |t|
      t.string :book_name
      t.string :book_number
      t.string :book_edition
      t.string :author_type
      t.references :domain, foreign_key: true
      t.references :author, foreign_key: true
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
