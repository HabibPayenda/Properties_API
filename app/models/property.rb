# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :property_manager
  belongs_to :agent

  has_many :amenities, dependent: :destroy
  has_many :restrictions, dependent: :destroy
  has_many :deal_infos, dependent: :destroy

  has_many :property_addresses, dependent: :destroy
  has_many :addresses, through: :property_addresses

  has_one_attached :image
  after_create_commit do
    set_image_url
  end

  private

  def set_image_url
    self.image_url = self.image.url
    self.save
  end
end
