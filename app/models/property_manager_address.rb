class PropertyManagerAddress < ApplicationRecord
  belongs_to :address
  belongs_to :property_manager
end
