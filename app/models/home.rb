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

  def self.recommendations_for_user(some_user_id)
    viewed_home_ids = UserHomeView.where(user_id: some_user_id).pluck("home_id")

    similar_user_ids = UserHomeView.where(home_id: viewed_home_ids).pluck(:user_id).uniq - [some_user_id]
    similar_home_ids = UserHomeView.where(user_id: similar_user_ids).pluck(:home_id).uniq - viewed_home_ids
    puts similar_home_ids
    puts "***********************"
    puts similar_user_ids
    if similar_user_ids.empty? || similar_home_ids.empty?
      # Fallback strategy
      viewed_home = Home.includes(:home_rooms, :deal_info).find_by(id: viewed_home_ids)
      similar_homes = Home.joins(:home_rooms)
                          .where.not(id: similar_home_ids)
                          .where(home_rooms: { home_id: viewed_home_ids })

      if viewed_home.present? && viewed_home.deal_info.present?
        similar_homes = similar_homes.where(deal_infos: { deal_type: viewed_home.deal_info.deal_type })      end

      similar_homes = similar_homes.order('RANDOM()').limit(3)
      similar_homes
    end

    # Collaborative filtering strategy
    recommendations_cf = Home.where(id: similar_home_ids).map do |home|
      score = 0

      viewed_home_ids.each do |viewed_home_id|
        viewed_home = Home.find(viewed_home_id)
        similarity = viewed_home.similarity_to(home)

        score += similarity
      end

      [home, score]
    end

    # Content-based filtering strategy
    viewed_homes = Home.where(id: viewed_home_ids)
    recommendations_cb = viewed_homes.flat_map do |viewed_home|
      viewed_home.similar_homes(3)
    end

    # Combine the two recommendation lists and sort by score
    recommendations = (recommendations_cf + recommendations_cb)
    # recommendations.sort_by! { |_home, score| -score }

    # Return the top 3 recommendations
    recommendations.take(3)
  end

  def similar_homes(limit = 3)
    room_count_range = (self.home_rooms.count - 2)..(self.home_rooms.count + 2)
    Home.joins(:property, :deal_info, :home_rooms)
        .where(deal_infos: { deal_type: self.property.deal_info.deal_type })
        .select('homes.*, COUNT(home_rooms.*) as home_rooms_count')
        .group("homes.id")
        .having('COUNT(home_rooms.*) BETWEEN ? AND ?', room_count_range.begin, room_count_range.end)        .order("RANDOM()")
        .limit(limit)

  end

  def similarity_to(other_home)
    # Compute the similarity between two homes based on their number of rooms, price, and deal type
    # You can use a distance metric like Euclidean distance or cosine similarity here
    if self.home_rooms && other_home.home_rooms && self.deal_info && other_home.deal_info
      room_distance = (self.home_rooms.count - other_home.home_rooms.count).abs
      price_distance = (self.deal_info.total_price - other_home.deal_info.total_price).abs
      deal_distance = (self.deal_info.deal_type - other_home.deal_info.deal_type).abs
      distance = Math.sqrt(room_distance ** 2 + price_distance ** 2 + deal_distance ** 2)
      similarity = 1.0 / (1.0 + distance)
    else
      similarity = 0.0
    end
    similarity
  end

end
