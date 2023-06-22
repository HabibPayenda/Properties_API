# frozen_string_literal: true

class UserHomeView < ApplicationRecord
  belongs_to :user
  belongs_to :home

  after_create :create_recommendable_rating

  private

  def create_recommendable_rating
    user.rate(home, 1)
  end
end
