class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :agent
end
