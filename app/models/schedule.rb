class Schedule < ApplicationRecord
  belongs_to :branch
  validates :day, :start, :end, presence: true
  validate :start_is_before_end
  validate :day_is_unique

  def start_is_before_end
    if start.present? && self.end.present? && start > self.end
      errors.add(:start, "La hora de inicio debe ser anterior a la hora de fin")
    end
  end

  def day_is_unique
    if day.present? && branch.schedules.where(day: day).any?
      errors.add(:day, "Ya existe un horario para ese día")
    end
  end
end
