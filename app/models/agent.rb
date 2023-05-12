# frozen_string_literal: true

class Agent < ApplicationRecord
  has_many :properties
  has_many :property_managers
  belongs_to :admin
  has_many :agent_addresses
  has_many :addresses, through: :agent_addresses
  has_one :agent_contact
  has_one :contact, through: :agent_contact
end
