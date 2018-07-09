module Sticker
  class JwtUtil
    class << self
      def encode(data, exp = 7.days.from_now)
        payload = {}
        payload[:data] = data
        payload[:exp] = exp.to_i
        payload[:iss] = Sticker::Integration::AUTHOR
        payload[:jti] = SecureRandom.base64
        payload[:iat] = Time.now.utc
        payload[:sub] = 'Sticker server access token'
        JWT.encode(payload, Sticker::Integration.configuration.api_secret)
      end

      def decode(token)
        payload = JWT.decode(token, Sticker::Integration.configuration.api_secret)[0]
        payload = ActiveSupport::HashWithIndifferentAccess.new payload
        payload[:data]
      end
    end
  end
end