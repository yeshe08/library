class CreateBookids < ActiveRecord::Migration[5.1]
  def change
    create_table :bookids do |t|
      t.string :book_id
      t.boolean :is_issue
      t.boolean :is_blocked
      t.references :book_detail, foreign_key: true
      t.timestamps
    end
  end
end
