class Turn < ApplicationRecord
  belongs_to :branch
  belongs_to :client, class_name: "User"
  belongs_to :manager, class_name: "User", optional: true
  validates :date, :time, :reason, presence: true
  validates :date, comparison: { greater_than: Date.current, message: "La fecha debe ser posterior a la actual" }
  validate :time_is_valid?

  def time_is_valid?
    day_name = I18n.l(date, format: "%A").capitalize
    schedule = branch.schedules.find_by(day: day_name)
    if schedule.nil?
      errors.add(:time, "La sucursal no abre ese día")
    elsif time < schedule.start || time > schedule.end
      errors.add(:time, "La sucursal no abre a esa hora")
    end
  end

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
