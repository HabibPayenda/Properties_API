# frozen_string_literal: true

class PropertyManager < ApplicationRecord
  has_many :properties
  has_one :property_manager_contact
  has_one :contact, through: :property_manager_contact
  has_many :property_manager_addresses
  has_many :addresses, through: :property_manager_addresses
  has_many :property_manager_reviews
  has_many :reviews, through: :property_manager_reviews
  belongs_to :agent
end
