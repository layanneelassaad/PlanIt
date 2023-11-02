class AddUrlToActivitiesAndChangeDescription < ActiveRecord::Migration
  def change
    add_column :activities, :url, :string
    change_column :activities, :description, :text
  end
end
