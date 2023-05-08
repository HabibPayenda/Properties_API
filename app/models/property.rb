# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :property_manager
  belongs_to :agent

  has_many :amenities, dependent: :destroy
  has_many :restrictions, dependent: :destroy
  has_many :deal_infos, dependent: :destroy

  has_many :property_addresses, dependent: :destroy
end
