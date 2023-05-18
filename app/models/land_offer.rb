# frozen_string_literal: true

class LandOffer < ApplicationRecord
  belongs_to :land
  belongs_to :offer
end
