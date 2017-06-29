class Appointment < ApplicationRecord
  extend Enumerize
  belongs_to :patient, class_name: 'User'

  validates :date, presence: true

  enumerize :situation, in: { scheduled: 0, cancelled: 1,
                              pending_schedule: 2, pending_cancel: 3 }, default: :pending_schedule
end
