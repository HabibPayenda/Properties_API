# frozen_string_literal: true

class UserFavoriteCar < ApplicationRecord
  belongs_to :user
  belongs_to :car
end
