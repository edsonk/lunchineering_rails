class EventVotesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'event_votes'
  end

  def receive(data)
    ActionCable.server.broadcast 'event_votes', data
  end
end
