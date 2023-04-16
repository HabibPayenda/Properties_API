class AgentReport < ApplicationRecord
  belongs_to :report
  belongs_to :user
  belongs_to :agent
end
