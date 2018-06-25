require 'sticker/jwt_util'
require 'sticker/integration/configuration'
require 'sticker/integration/metadata'

module Sticker
  module Integration
    class Api < ::Rails::Engine
      isolate_namespace Sticker
    end
  end
end
