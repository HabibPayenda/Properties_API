# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_addresses
  has_many :user_contact
  has_many :user_favorites
  has_many :user_searches
  has_many :user_views
  has_many :user_reviews

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
