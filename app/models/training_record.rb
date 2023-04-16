class TrainingRecord < ApplicationRecord
  belongs_to :trainer
  belongs_to :agent
  belongs_to :training
end
