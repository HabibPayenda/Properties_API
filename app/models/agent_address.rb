class AgentAddress < ApplicationRecord
  belongs_to :address
  belongs_to :agent
end
