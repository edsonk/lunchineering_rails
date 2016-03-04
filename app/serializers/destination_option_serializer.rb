class DestinationOptionSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :selected

  has_one :destination

  def selected
    object.voted_by?(current_user)
  end
end
