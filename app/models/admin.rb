# frozen_string_literal: true

class Admin < ApplicationRecord
  has_secure_password
  has_many :agents
end
