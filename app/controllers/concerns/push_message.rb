module PushMessage
  extend ActiveSupport::Concern

  def push_message(event, data)
    Pusher['tapseed_channel'].trigger_async(event, { message: data })
  end
end
