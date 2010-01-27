class CreateFollowRequests < ActiveRecord::Migration
  def self.up
    create_table :follow_requests do |t|
      t.integer :birder_id
      t.integer :follower_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :follow_requests
  end
end
