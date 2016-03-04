class EventVote < ActiveRecord::Base
  include BelongsToUser

  belongs_to :event
  belongs_to :destination_option

  has_one :destination, through: :destination_option

  validates :event_id, uniqueness: { scope: :user_id }
  validates :destination_option, inclusion: { in: :permitted_options }, allow_nil: true
  validate :event_available

  def self.for_option(option)
    where(destination_option_id: option)
  end

  def permitted_options
    event.destination_options
  end

  private

  def event_available
    if event.closed?
      errors.add(:base, 'Event is closed for voting')
    end
  end
end
