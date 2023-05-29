# frozen_string_literal: true

class Home < ApplicationRecord
  belongs_to :property, dependent: :destroy
  has_many :home_rooms, dependent: :destroy
  has_one :home_offer
  has_one :offer, through: :home_offer
  has_one :address, through: :property
  has_many :amenities, through: :property
  has_many :restrictions, through: :property
  has_one :deal_info, through: :property
end
