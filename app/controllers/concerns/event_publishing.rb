module Concerns
  module EventPublishing
    require 'eventmachine'

    def publish_event(endpoint, message)
      EM.run { client.publish(endpoint, message) }
    end

    private

    def client
      @client ||= Faye::Client.new('http://localhost:3000/faye')
    end
  end
end
