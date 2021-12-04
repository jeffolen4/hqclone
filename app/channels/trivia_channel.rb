class TriviaChannel < ApplicationCable::Channel
  def subscribed
    stream_from "trivia_channel_#{params[:game_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
