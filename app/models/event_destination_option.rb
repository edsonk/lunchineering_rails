class EventDestinationOption < ActiveRecord::Base
  belongs_to :event
  belongs_to :destination
end
