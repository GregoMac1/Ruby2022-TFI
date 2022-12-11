class AddDefaultPending < ActiveRecord::Migration[7.0]
  def change
    change_column_default :turns, :status, "pending"
  end
end
