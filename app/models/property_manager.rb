# frozen_string_literal: true

class PropertyManager < ApplicationRecord
  has_many :properties
  has_many :property_manager_addresses
  has_many :property_manager_reviews
end
