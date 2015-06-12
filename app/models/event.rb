class Event < ActiveRecord::Base
  after_initialize :set_default_state

  has_many :votes, class_name: 'EventVote'
  has_many :destination_options, class_name: 'EventDestinationOption'

  def self.chronological
    order(:created_at)
  end

  private

  def set_default_state
    self.state ||= :new
  end
end
