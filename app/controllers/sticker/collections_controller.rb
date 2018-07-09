module Sticker
  class CollectionsController < BaseController
    if Rails.version.to_i > 3
      before_action :find_user
    else
      before_filter :find_user
    end

    def purchase
      purchase_info = StickerMethods.purchase_collection(params)
      if purchase_info[:errors].count == 0
        render status: :ok, json: purchase_info
      else
        render status: :unprocessable_entity, json: { message: purchase_info[:errors][0]}
      end
    end

    private

    def find_user
      @current_user = StickerMethods.find_user(params)
      render status: :not_found, json: { message: 'User not found' } unless @current_user
    end
  end
end