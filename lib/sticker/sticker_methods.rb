module Sticker
  module StickerMethods
    def self.verify_user(data = {})
      raise 'Need to be implemented by installed source'
    end

    def self.find_user(data = {})
      raise 'Need to be implemented by installed source'
    end
  end
end