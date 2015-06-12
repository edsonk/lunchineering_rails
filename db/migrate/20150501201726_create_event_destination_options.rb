class CreateEventDestinationOptions < ActiveRecord::Migration
  def change
    create_table :event_destination_options do |t|
      t.references :event
      t.references :destination
      t.boolean :selected, default: false, nil: false
      t.timestamps
    end
  end
end
