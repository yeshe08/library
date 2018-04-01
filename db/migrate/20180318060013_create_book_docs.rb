class CreateBookDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :book_docs do |t|
      t.string :book_name
      t.string :pdf_doc
      t.references :book_detail, foreign_key: true
      
      t.timestamps
    end
  end
end