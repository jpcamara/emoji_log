require "test_helper"

class EmojiLogTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert EmojiLog::VERSION
  end

  test 'it does log stuff' do
    event = ActiveSupport::Notifications::Event.new(
      'process_action.action_controller',
      Time.now,
      Time.now,
      2,
      status: 200,
      controller: 'HomeController',
      action: 'index',
      format: 'application/json',
      method: 'GET',
      path: '/home?foo=bar',
      # params: event_params,
      params: {},
      db_runtime: 5000,
      view_runtime: 5000
      # db_runtime: 0.02,
      # view_runtime: 0.01
    )

    subscriber = EmojiLog::ActionController.new
    subscriber.process_action(event)
  end
end
