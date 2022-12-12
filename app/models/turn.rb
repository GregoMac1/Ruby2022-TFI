class Turn < ApplicationRecord
  validates :client_id, :branch_id, :date, :time, :reason, presence: true

  def get_status_name
    case status
    when "pending"
      "Pendiente"
    when "attended"
      "Atendido"
    when "not_attended"
      "No atendido"
    end
  end
end
