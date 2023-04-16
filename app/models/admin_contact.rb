# frozen_string_literal: true

class AdminContact < ApplicationRecord
  belongs_to :contact
  belongs_to :admin
end
