class Event < ActiveRecord::Base
  include Chronology

  after_initialize :set_defaults

  has_many :votes, class_name: 'EventVote'
  has_many :destination_options

  set_chronology

  def self.check_closed!
    to_close.each(&:close!)
  end

  def self.to_close
    where("expires_at <= ?", Time.now).where.not(state: :closed)
  end

  def user_vote(user)
    votes.by_user(user).first
  end

  def closed?
    state.to_s == 'closed'
  end

  def close!
    return if closed?

    destination_options.max_by(&:vote_count).select!
    update_attribute(:state, :closed)
  end

  private

  def set_defaults
    self.state ||= :new
    self.expires_at ||= 2.days.from_now
  end
end
