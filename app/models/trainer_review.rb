# frozen_string_literal: true

class TrainerReview < ApplicationRecord
  belongs_to :agent
  belongs_to :trainer
  belongs_to :review
end
