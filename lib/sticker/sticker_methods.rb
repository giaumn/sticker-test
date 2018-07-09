module Sticker
  module StickerMethods
    def self.verify_authentication(data = {})
      raise 'Need to be implemented by installed source'
    end

    def self.generate_token_payload(data)
      raise 'Need to be implemented by installed source'
    end

    def self.find_user(data = {})
      raise 'Need to be implemented by installed source'
    end

    def self.purchase_collection(data = {})
      raise 'Need to be implemented by installed source'
    end
  end
end