class Appointment < ApplicationRecord
  extend Enumerize

  belongs_to :patient, class_name: 'User'

  enumerize :situation, in: { open: 0, scheduled: 1, canceled: 2 }, default: :open
end
