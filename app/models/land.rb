# frozen_string_literal: true

class Land < ApplicationRecord
  belongs_to :property
  has_one :land_offer
  has_one :offer, through: :land_offer
end
