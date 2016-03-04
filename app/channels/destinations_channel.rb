class DestinationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'destinations'
  end

  def receive(data)
    ActionCable.server.broadcast 'destinations', data
  end
end
