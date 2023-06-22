# frozen_string_literal: true


class Home < ApplicationRecord
  belongs_to :property, dependent: :destroy
  has_many :home_rooms, dependent: :destroy
  has_one :home_offer, dependent: :destroy
  has_one :offer, through: :home_offer, dependent: :destroy
  has_one :address, through: :property, dependent: :destroy
  has_many :amenities, through: :property, dependent: :destroy
  has_many :restrictions, through: :property, dependent: :destroy
  has_one :deal_info, through: :property, dependent: :destroy

  def self.recommendations_for_user(user_id)
    # Find all homes that the user has viewed
    viewed_home_ids = UserHomeView.where(user_id:).pluck(:home_id)

    # Find all users who have viewed the same homes as the target user
    similar_user_ids = UserHomeView.where(home_id: viewed_home_ids).pluck(:user_id).uniq - [user_id]

    # Find all homes that the similar users have viewed, but that the target user has not viewed
    similar_home_ids = UserHomeView.where(user_id: similar_user_ids).pluck(:home_id).uniq - viewed_home_ids

    # Generate recommendations by scoring each home based on its similarity to the viewed homes
    recommendations = Home.where(id: similar_home_ids).map do |home|
      score = 0

      viewed_home_ids.each do |viewed_home_id|
        viewed_home = Home.find(viewed_home_id)
        similarity = viewed_home.similarity_to(home)

        score += similarity
      end

      [home, score]
    end

    # Sort the recommendations by score and return the top 3
    recommendations.sort_by! { |_home, score| -score }
    recommendations.take(3).map(&:first)
  end

  def similarity_to(other_home)
    # Compute the similarity between two homes based on their properties
    # You can use any similarity metric that makes sense for your data
    # Here's an example using Euclidean distance:

    total_distance = 0

    total_distance += (home_rooms.count - other_home.home_rooms.count)**2
    # total_distance += (self.bathrooms - other_home.bathrooms) ** 2
    # total_distance += (self.square_feet - other_home.square_feet) ** 2

    1 / Math.sqrt(total_distance)
  end
end
