class Sighting < ActiveRecord::Base
	belongs_to :bird
	belongs_to :birder
	
	validates_presence_of :bird_id, :birder_id, :sighting_date
	validates_uniqueness_of :bird_id, :scope => :birder_id, :message => "You have already recorded a sighting of this species"
end
