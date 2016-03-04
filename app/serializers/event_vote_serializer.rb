class EventVoteSerializer < ActiveModel::Serializer
  attributes :id, :destination_option_id, :created_at

  belongs_to :destination_option
  has_one :destination, through: :destination_option
end
