class CreateBirds < ActiveRecord::Migration
  def self.up
    create_table :birds do |t|
      t.string :vernacular_name, :null => false
      t.string :international_name
      t.string :scientific_name
      t.string :category
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :birds
  end
end
