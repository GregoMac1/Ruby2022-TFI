class Schedule < ApplicationRecord
  belongs_to :branch

  validates :day, :start, :end, presence: true
end
