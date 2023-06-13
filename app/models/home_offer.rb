# frozen_string_literal: true

class HomeOffer < ApplicationRecord
  belongs_to :home
  belongs_to :offer
end
