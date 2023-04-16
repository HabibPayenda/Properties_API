# frozen_string_literal: true

class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :agent
  belongs_to :deal_info
end
