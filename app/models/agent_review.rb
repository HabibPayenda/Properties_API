class AgentReview < ApplicationRecord
  belongs_to :agent
  belongs_to :appointment
  belongs_to :user
  belongs_to :review
end
