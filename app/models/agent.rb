# frozen_string_literal: true

class Agent < ApplicationRecord
  has_many :properties
  has_many :property_managers
  belongs_to :admin
  has_one :agent_address
  has_one :address, through: :agent_address
  has_one :agent_contact
  has_one :contact, through: :agent_contact
  has_one_attached :image

  after_create_commit do
    set_image_url
  end

  private

  def set_image_url
    self.image_url = image.url
    save
  end
end
