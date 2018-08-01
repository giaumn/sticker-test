module Sticker
  class CollectionsController < BaseController
    def purchase
      render status: :ok, nothing: true
    end
  end
end