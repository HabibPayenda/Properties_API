# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_one :user_address
  has_one :user_contact
  has_many :user_favorites
  has_many :user_searches
  has_many :user_views
  has_many :user_reviews

  has_many :reviews, through: :user_reviews
  has_one :contact, through: :user_contact
  has_one :address, through: :user_address

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
