class AddNullFalse < ActiveRecord::Migration[7.0]
  def change
    change_table :branches do |t|
      t.change :name, :string, null: false
      t.change :address, :string, null: false
      t.change :phone, :string, null: false
    end

    change_table :schedules do |t|
      t.change :day, :string, null: false
      t.change :start, :time, null: false
      t.change :end, :time, null: false
    end

    change_table :turns do |t|
      t.change :date, :date, null: false
      t.change :time, :time, null: false
      t.change :reason, :string, null: false
      t.change :status, :string, null: false
    end

    change_table :users do |t|
      t.change :password_digest, :string, null: false
      t.change :email, :string, unique: true
    end
  end
end
