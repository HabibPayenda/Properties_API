# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_one :user_address
  has_one :user_contact
  has_many :user_favorites
  has_many :user_searches
  has_many :user_views
  has_many :user_reviews
  has_many :user_favorite_lands
  has_many :user_favorite_cars
  has_many :user_favorite_homes
  has_many :homes, through: :user_favorite_homes
  has_many :cars, through: :user_favorite_cars
  has_many :lands, through: :user_favorite_lands

  has_many :reviews, through: :user_reviews
  has_one :contact, through: :user_contact
  has_one :address, through: :user_address

  has_one_attached :image



  private

  def set_image_url

    self.image_url = self.image.url
    save
  end
end
