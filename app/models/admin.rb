# frozen_string_literal: true

class Admin < ApplicationRecord
  has_many :agents
end
