class ChangeTurnTime < ActiveRecord::Migration[7.0]
  def change
    change_table :turns do |t|
      t.remove :start_time
      t.date :date
      t.time :time
    end
  end
end
