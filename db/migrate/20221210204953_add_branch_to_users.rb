class AddBranchToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :branch, foreign_key: true, optional: true
  end
end
