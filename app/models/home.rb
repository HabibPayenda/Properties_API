# frozen_string_literal: true
#

class Home < ApplicationRecord
  belongs_to :property, dependent: :destroy
  has_many :home_rooms, dependent: :destroy
  has_one :home_offer, dependent: :destroy
  has_one :offer, through: :home_offer, dependent: :destroy
  has_one :address, through: :property, dependent: :destroy
  has_many :amenities, through: :property, dependent: :destroy
  has_many :restrictions, through: :property, dependent: :destroy
  has_one :deal_info, through: :property, dependent: :destroy
end
