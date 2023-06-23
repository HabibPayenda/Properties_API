# frozen_string_literal: true

class UserHomeView < ApplicationRecord
  belongs_to :user
  belongs_to :home
end
