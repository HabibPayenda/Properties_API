# frozen_string_literal: true

class CarOffer < ApplicationRecord
  belongs_to :car
  belongs_to :offer
end
