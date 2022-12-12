class Turn < ApplicationRecord
  validates :client_id, :branch_id, :date, :time, :reason, presence: true
end
