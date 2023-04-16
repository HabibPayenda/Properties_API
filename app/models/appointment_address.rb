class AppointmentAddress < ApplicationRecord
  belongs_to :address
  belongs_to :appointment
end
