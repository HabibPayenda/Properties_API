# frozen_string_literal: true

class PropertySerializer
  include JSONAPI::Serializer
  attributes :id, :owner_name, :description, :availability_status, :property_manager_id, :agent_id
  has_one :contact
end
# owner_name: home?.owner_name,
#     name: property?.name,
#     description: property?.description,
#     availability_status: property?.availability_status,
#     property_manager_id: property?.property_manager_id,
#     agent_id: property?.agent_id,
#     province: property?.addresses[0]?.province,
#     city: property?.addresses[0]?.city,
#     district: property?.addresses[0]?.district,
#     deal_type: property?.deal_infos[0]?.deal_type,
#     duration: property?.deal_infos[0]?.duration,
#     price_per_duration: property?.deal_infos[0]?.price_per_duration,
#     total_price: property?.deal_infos[0]?.total_price,
#     total_duration: property?.deal_infos[0]?.total_duration,
