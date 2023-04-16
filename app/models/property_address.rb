# frozen_string_literal: true

class PropertyAddress < ApplicationRecord
  belongs_to :address
  belongs_to :property
end
