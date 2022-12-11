class RemoveUserColumn < ActiveRecord::Migration[7.0]
  def change
    change_table :turns do |t|
      t.remove :user_id
    end
  end
end
