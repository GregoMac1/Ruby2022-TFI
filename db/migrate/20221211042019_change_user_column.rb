class ChangeUserColumn < ActiveRecord::Migration[7.0]
  def change
    change_table :turns do |t|
      t.remove :user
      t.belongs_to :client, null: false, foreign_key: { to_table: :users }
    end
  end
end
