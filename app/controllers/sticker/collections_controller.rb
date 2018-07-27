module Sticker
  class CollectionsController < BaseController
    if Rails.version.to_i > 3
      before_action :find_user
    else
      before_filter :find_user
    end

    def purchase
      render status: :ok, nothing: true
    end

    private

    def find_user
      @current_user = StickerMethods.find_user(params)
      render status: :not_found, json: { message: 'User not found' } unless @current_user
    end
  end
end