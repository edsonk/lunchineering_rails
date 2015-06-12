class CreateEventVotes < ActiveRecord::Migration
  def change
    create_table :event_votes do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.references :destination_option, index: true
      t.timestamps
    end
  end
end
