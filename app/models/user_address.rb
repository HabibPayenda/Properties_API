# frozen_string_literal: true

class UserAddress < ApplicationRecord
  belongs_to :address
  belongs_to :user
end
