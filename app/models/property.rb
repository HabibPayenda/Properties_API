# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :property_manager
  belongs_to :agent

  has_many :amenities, dependent: :destroy
  has_many :restrictions, dependent: :destroy
  has_one :deal_info, dependent: :destroy

  has_one :property_address, dependent: :destroy
  has_one :address, through: :property_address


  has_one :offer

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
