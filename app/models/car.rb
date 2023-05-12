# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :property
  belongs_to :agent
end
