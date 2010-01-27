class CreateSightings < ActiveRecord::Migration
  def self.up
    create_table :sightings do |t|
      t.integer :birder_id, :null => false, :options =>
        "CONSTRAINT fk_sighting_birders REFERENCES birders(id)"
      t.integer :bird_id, :null => false, :options =>
        "CONSTRAINT fk_sighting_birds REFERENCES birds(id)"
      t.date :sighting_date, :null => false
      t.string :location
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :sightings
  end
end
