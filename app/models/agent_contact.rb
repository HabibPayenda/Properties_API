# frozen_string_literal: true

class AgentContact < ApplicationRecord
  belongs_to :contact
  belongs_to :agent
end
