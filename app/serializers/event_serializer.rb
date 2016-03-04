class EventSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :expires_at, :state

  has_many :destination_options
  has_many :votes
end
