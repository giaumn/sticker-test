module Sticker
  class CollectionsController < BaseController
    def purchase
      purchase_info = StickerMethods.purchase_collection(params)
      if purchase_info[:errors].count == 0
        render status: :ok, json: purchase_info
      else
        render status: :unprocessible_entity, json: { message: purchase_info[:errors][0]}
      end
    end
  end
end