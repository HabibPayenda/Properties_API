# frozen_string_literal: true

class UserFavoriteHome < ApplicationRecord
  belongs_to :user
  belongs_to :home
end
