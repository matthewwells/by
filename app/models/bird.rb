class Bird < ActiveRecord::Base
	has_many :sightings
	has_many :birders, :through => :sightings
	
	validates_presence_of :vernacular_name
	validates_uniqueness_of :vernacular_name
	validates_uniqueness_of :scientific_name, :allow_nil => true

	def self.bird_map
		birds = find(:all, :order => :vernacular_name)
		bird_map = []
		birds.each {|bird| bird_map << [bird.vernacular_name, bird.id]}
		bird_map
	end
	
	def seen_by?(me_id)
		seen = false
		birders.each { |birder| seen = true if birder.id == me_id }
		seen
	end

end
