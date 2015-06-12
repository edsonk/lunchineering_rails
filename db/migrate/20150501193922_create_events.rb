class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :expires_at
      t.string :state
      t.timestamps
    end
  end
end
