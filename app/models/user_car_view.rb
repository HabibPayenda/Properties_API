# frozen_string_literal: true

class UserCarView < ApplicationRecord
  belongs_to :user
  belongs_to :car
end
