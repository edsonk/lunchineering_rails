class Destination < ActiveRecord::Base
  extend Randomize

  def self.alphabetized
    order("lower(#{table_name}.name)")
  end

  def self.chronological
    order(:created_at)
  end
end
