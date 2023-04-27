# frozen_string_literal: true

class Agent < ApplicationRecord
  has_many :properties
  has_many :property_managers
  belongs_to :admin
end
