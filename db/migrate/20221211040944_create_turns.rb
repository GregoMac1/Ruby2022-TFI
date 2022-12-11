class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :branch, null: false, foreign_key: true
      t.datetime :start_time
      t.string :reason
      t.string :status
      t.belongs_to :manager, foreign_key: { to_table: :users }
      t.string :result

      t.timestamps
    end
  end
end
