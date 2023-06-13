# frozen_string_literal: true

class Land < ApplicationRecord
  belongs_to :property
  has_one :land_offer
  has_one :offer, through: :land_offer
  has_one :address, through: :property
  has_one :deal_info, through: :property
  belongs_to :agent
  belongs_to :property_manager
  has_one_attached :image
end
