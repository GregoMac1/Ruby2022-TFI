class ChangeDataTypeForStartAndEnd < ActiveRecord::Migration[7.0]
  def change
    change_column(:schedules, :start, :time)
    change_column(:schedules, :end, :time)
  end
end
