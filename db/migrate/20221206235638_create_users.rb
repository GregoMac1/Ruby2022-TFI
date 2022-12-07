class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, foreign_key: true
      t.string :name, null: false
      t.string :password, null: false
      t.string :role, null: true
      t.references :branch, null: true

      t.timestamps
    end
  end
end
