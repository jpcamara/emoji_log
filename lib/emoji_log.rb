require "emoji_log/version"
require "emoji_log/railtie"

module EmojiLog
  def self.setup(app)
    # self.application = app
    EmojiLog.slow = "🐢"
    EmojiLog.average = "🐇"
    EmojiLog.fast = "🚀"
    EmojiLog.slow_threshold = 1000
    EmojiLog.average_threshold = 500
    EmojiLog.fast_threshold = 150

    EmojiLog.info = "🧠"
    EmojiLog.success = "✅"
    EmojiLog.redirect = "🔁"
    EmojiLog.bad = "❌"
    EmojiLog.error = "🔥"
    EmojiLog.cancelled = "❓"

    ::EmojiLog::ActionController.attach_to :action_controller
  end

  class << self
    attr_accessor :slow, :average, :fast, :slow_threshold, :average_threshold, :fast_threshold,
      :info, :success, :redirect, :bad, :error, :cancelled
  end

  class ActionController < ActiveSupport::LogSubscriber
    ONE = 100...199
    TWO = 200...299
    THREE = 300...399
    FOUR = 400...499
    FIVE = 500...599

    def process_action(event)
      info do
        payload = event.payload
        additions = ::ActionController::Base.log_process_action(payload)
        status = payload[:status]

        if status.nil? && (exception_class_name = payload[:exception]&.first)
          status = ::ActionDispatch::ExceptionWrapper.status_code_for_exception(exception_class_name)
        end

        additions << "Allocations: #{event.allocations}"

        speed_emoji = emoji_speed(event)
        status_emoji = emoji_status(status)
        
        message = +"#{speed_emoji * 3} [#{payload[:path]}] Completed #{status} #{Rack::Utils::HTTP_STATUS_CODES[status]}#{status_emoji} in #{event.duration.round}ms" \
                   " (#{additions.join(" | ")})"
        message << "\n\n" if defined?(::Rails.env) && ::Rails.env.development?

        message
      end
    end

    def emoji_status(status)
      case status
      when ONE
        " #{EmojiLog.info}"
      when TWO
        " #{EmojiLog.success}"
      when THREE
        " #{EmojiLog.redirect}"
      when FOUR
        " #{EmojiLog.bad}"
      when FIVE
        " #{EmojiLog.error}"
      when 0
        " #{EmojiLog.cancelled}"
      else
        ""
      end
    end

    def emoji_speed(event)
      if event.duration <= EmojiLog.fast_threshold
        EmojiLog.fast
      elsif event.duration <= EmojiLog.average_threshold
        EmojiLog.average
      else
        EmojiLog.slow
      end
    end
  end
end

require 'emoji_log/railtie' if defined?(Rails)