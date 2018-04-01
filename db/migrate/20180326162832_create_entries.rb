class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      # t.string :student_id
      t.string :issue_date
      t.string :return_date
      t.references :bookid, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
