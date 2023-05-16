# frozen_string_literal: true

class Home < ApplicationRecord
  belongs_to :property, dependent: :destroy
  has_many :home_rooms, dependent: :destroy
  has_one :offer, through: :property
end
