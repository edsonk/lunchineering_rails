module Concerns
  module EventPublishing
    def publish_event(endpoint, message)
      ActionCable.server.broadcast(endpoint, message)
    end
  end
end
