# frozen_string_literal: true

class Offer < ApplicationRecord
  belongs_to :deal_info
  belongs_to :property
end
