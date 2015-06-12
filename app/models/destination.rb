class Destination < ActiveRecord::Base
  extend Randomize

  def self.chronological
    order(:created_at)
  end
end
