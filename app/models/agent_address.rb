# frozen_string_literal: true

class AgentAddress < ApplicationRecord
  belongs_to :address
  belongs_to :agent
end
