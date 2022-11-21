class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :day
      t.string :start
      t.string :end
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
