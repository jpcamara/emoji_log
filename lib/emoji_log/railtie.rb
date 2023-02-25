# frozen_string_literal: true

require 'rails/railtie'
require 'action_view/log_subscriber'
require 'action_controller/log_subscriber'

module EmojiLog
  class Railtie < ::Rails::Railtie
    config.after_initialize do |app|
      EmojiLog.setup(app)
    end
  end
end