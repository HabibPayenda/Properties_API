# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent

  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token
    auth_header = request.headers['Authorization']
    return unless auth_header

    token = auth_header.split(' ')[1]
    begin
      JWT.decode(token, 'secret', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def authorized_admin
    decoded_token = decode_token
    return unless decoded_token

    admin_id = decoded_token[0]['admin_id']
    admin_name = decoded_token[0]['admin_name']
    admin = Admin.find(admin_id)
    admin.name == admin_name
  end

  def authorized_user
    decoded_token = decode_token
    return unless decoded_token

    user_id = decoded_token[0]['id']
    user_name = decoded_token[0]['user_name']
    user = User.find(user_id)
    user.name == user_name
  end

  def authorize_user
    render json: { message: 'You have to login' } unless authorized_user
  end

  def authorize_admin
    render json: { message: 'You have to login' } unless authorized_admin
  end
end
