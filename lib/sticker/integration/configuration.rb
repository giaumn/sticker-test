module Sticker
  module Integration
    class Configuration
      attr_accessor :api_key, :api_secret

      def initialize
        @api_key = nil
        @api_secret = nil
      end

      def get_auth_model
        @auth_model.to_s.classify.constantize
      end
    end

    class << self
      attr_accessor :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def reset
        @configuration = Configuration.new
      end

      def configure
        yield(configuration)
        raise 'Missing :api_key configuration' if @configuration.api_key.blank?
        raise 'Missing :api_secret configuration' if @configuration.api_secret.blank?
      end
    end
  end
end