# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :property_manager
  belongs_to :agent

  has_many :amenities
  has_many :restrictions
  has_many :deal_infos
end
