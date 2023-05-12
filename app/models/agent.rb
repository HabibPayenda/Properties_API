# frozen_string_literal: true

class Agent < ApplicationRecord
  has_many :properties
  has_many :property_managers
  belongs_to :admin
  has_many :agent_addresses
  has_many :addresses, through: :agent_addresses
  has_many :agent_contacts
  has_many :contacts, through: :agent_contacts
end
