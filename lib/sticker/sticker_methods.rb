module Sticker
  module StickerMethods
    def self.purchase_collection(data = {})
      raise 'Need to be implemented by installed source'
    end

    def self.access_token_payload(data)
      raise 'Need to be implemented by installed source'
    end

    def self.find_for_authentication(data = {})
      raise 'Need to be implemented by installed source'
    end

    def self.verify_authentication(data = {})
      raise 'Need to be implemented by installed source'
    end
  end
end