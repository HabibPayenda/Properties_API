
require 'httparty'

class ExpoNotification
  attr_accessor :user, :title, :body

  def initialize(user, title, body)
    super()
    @user = user
    @title = title
    @body = body
  end

  def notify
    begin
      url = 'https://exp.host/--/api/v2/push/send'

      request = {
          to: @user.push_token,
          title: @title,
          body: @body
      }

      HTTParty.post(url, body: request.to_json, headers: { 'Content-Type' => 'application/json' })

    rescue
    end
  end
end


