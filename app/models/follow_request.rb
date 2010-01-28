class FollowRequest < ActiveRecord::Base
  validates_presence_of :birder_id
  validates_presence_of :follower_id
  validates_uniqueness_of :follower_id, :scope => :birder_id
  validates_presence_of :status
  validates_inclusion_of :status, :in => ['Accepted', 'Rejected', 'Requested']
  
  validate :dont_follow_self
    
  belongs_to :birder
  belongs_to :follower, :class_name => 'Birder'
  
  def accepted?
    status == 'Accepted'
  end

  def requested?
    status == 'Requested'
  end
  
  def rejected?
    status == 'Rejected'
  end

private

  def dont_follow_self
      errors.add(:birder_id, "You can't follow yourself!") if birder_id == follower_id
  end
end
