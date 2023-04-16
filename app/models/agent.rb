class Agent < ApplicationRecord
  has_many :properties
  belongs_to :admin
end
