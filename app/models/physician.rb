class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, :through => :appointmentsend
end