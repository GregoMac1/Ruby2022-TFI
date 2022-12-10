class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.remove :password
      t.remove :role
      t.remove :branch_id
    end
    add_column :users, :password_digest, :string
  end
end
