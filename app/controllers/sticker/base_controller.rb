module Sticker
  class BaseController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.

    protect_from_forgery with: :null_session

    if Rails.version.to_i > 3
      before_action :authorize, except: [:access_token]
    else
      before_filter :authorize, except: [:access_token]
    end

    attr_reader :current_user

    def access_token
      found_user = StickerMethods.verify_user({params: params, request: request})
      return render status: :unauthorized, json: { message: 'User is not found' } if found_user.blank?

      payload_data = {user: found_user.as_json(only: [:id])}
      access_token = JwtUtil.encode(payload_data)
      render status: :ok, json: { access_token: access_token, api_key: Integration.configuration.api_key }
    end

    private

    def authorize
      if request.headers['Authorization'].present?
        access_token = request.headers['Authorization'].split(' ').last
        begin
          JwtUtil.decode(access_token)
          @current_user = StickerMethods.find_user({params: params, request: request})
          render status: :not_found, json: { message: 'User not found' } unless @current_user
        rescue
          render status: :unauthorized, json: { message: 'Unauthorized access' }
        end
      else
        render status: :unauthorized, json: { message: 'Missing authorization access token' }
      end
    end
  end
end
