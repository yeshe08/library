class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_id
      t.string :email
      t.string :password
      t.string :mobile
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
