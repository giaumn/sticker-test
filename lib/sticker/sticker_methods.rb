module Sticker
  module StickerMethods
    def self.verify_user(data = {})
      raise 'Need to be implemented by installed source'
    end

    def self.find_user(data = {})
      return if data[:params].blank?
      user_class = 'User'.constantize
      user_class.find_by_id(data[:params][:userId])
    rescue
      nil
    end
  end
end