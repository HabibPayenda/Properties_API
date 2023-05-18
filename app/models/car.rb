# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :property
  belongs_to :agent
  has_one :car_offer
  has_one :offer, through: :car_offer
  has_one :address, through: :property
  has_one :deal_info, through: :property
  has_one_attached :image
end
