class CreateTripActivities < ActiveRecord::Migration
  def change
    create_table :trip_activities do |t|
      t.references :trip, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true
    end
  end
end
