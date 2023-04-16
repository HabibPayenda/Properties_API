class AdminAddress < ApplicationRecord
  belongs_to :address
  belongs_to :admin
end
