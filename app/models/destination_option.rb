class DestinationOption < ActiveRecord::Base
  self.table_name = 'event_destination_options'

  belongs_to :event
  belongs_to :destination

  has_many :event_votes, foreign_key: :destination_option_id

  def voted_by?(user)
    event_votes.by_user(user).any?
  end

  def vote_count
    event_votes.count
  end

  def select!
    update_attribute(:selected, true)
  end
end
