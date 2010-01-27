class CreateBirders < ActiveRecord::Migration
  def self.up
    create_table :birders do |t|
      t.string :user_name, :null => false
      t.string :first_name
      t.string :last_name
      t.string :hashed_password
      t.string :salt
      t.string :email_address

      t.timestamps
    end
  end

  def self.down
    drop_table :birders
  end
end
