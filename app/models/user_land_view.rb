# frozen_string_literal: true

class UserLandView < ApplicationRecord
  belongs_to :user
  belongs_to :land
end
