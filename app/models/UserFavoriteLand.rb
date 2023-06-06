# frozen_string_literal: true

class UserFavoriteLand < ApplicationRecord
  belongs_to :user
  belongs_to :land
end
