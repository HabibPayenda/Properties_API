# frozen_string_literal: true

class PropertyReport < ApplicationRecord
  belongs_to :user
  belongs_to :report
  belongs_to :property
end
