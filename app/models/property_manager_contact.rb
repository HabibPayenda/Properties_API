# frozen_string_literal: true

class PropertyManagerContact < ApplicationRecord
  belongs_to :contact
  belongs_to :property_manager
end
