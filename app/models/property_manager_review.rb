# frozen_string_literal: true

class PropertyManagerReview < ApplicationRecord
  belongs_to :agent
  belongs_to :property_manager
  belongs_to :appointment
  belongs_to :review
end
