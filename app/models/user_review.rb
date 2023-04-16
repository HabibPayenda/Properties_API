# frozen_string_literal: true

class UserReview < ApplicationRecord
  belongs_to :agent
  belongs_to :user
  belongs_to :appointment
  belongs_to :review
end
