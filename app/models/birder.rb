require 'digest/sha1'

class Birder < ActiveRecord::Base
	has_many :sightings
	has_many :birds, :through => :sightings
  has_many :follow_requests
  has_many :candidate_followers, :through => :follow_requests, :source => :follower
  has_many :followers, :through => :follow_requests,
           :conditions => "follow_requests.status == 'ACCEPTED'"
	
	validates_presence_of :user_name
	validates_uniqueness_of :user_name
	
	attr_accessor :password_confirmation
	validates_confirmation_of :password
	
	validate :password_non_blank
	
	def num_birds
#		sightings = Sighting.find_all_by_birder_id(id)
		birds.size
	end
	
	def password
		@password
	end
	
	def password=(pwd)
		@password = pwd
		return if pwd.blank?
		create_new_salt
		self.hashed_password = Birder.encrypted_password(self.password, self.salt)
	end
	
	def self.authenticate(name, password)
		user = self.find_by_user_name(name)
		if user
			expected_password = encrypted_password(password, user.salt)
			if user.hashed_password != expected_password
				user = nil
			end
		end
		user
	end
	
	def name
		first_name + " " + last_name
	end
	
private

  def password_non_blank
    	errors.add(:password, "Missing password") if hashed_password.blank?
	end
	
	def self.encrypted_password(password, salt)
		string_to_hash = password + "chiff" + salt
		Digest::SHA1.hexdigest(string_to_hash)
	end
	
	def create_new_salt
		self.salt = self.object_id.to_s + rand.to_s
	end
end
