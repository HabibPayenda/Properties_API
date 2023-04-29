# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_addresses
  has_many :user_contact
  has_many :user_favorites
  has_many :user_searches
  has_many :user_views
  has_many :user_reviews
end
