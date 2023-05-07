# frozen_string_literal: true

class Home < ApplicationRecord
  belongs_to :property
  has_many :home_rooms
end
