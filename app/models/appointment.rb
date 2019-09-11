class Appointment < ApplicationRecord
  belongs_to :Patient
  belongs_to :Physician
end
