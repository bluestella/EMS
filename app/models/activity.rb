class Activity < ActiveRecord::Base
  attr_accessible :description, :event_id, :location, :title, :starts_at, :ends_at

  belongs_to :event

  has_many :activityposts, dependent: :destroy
  has_many :posts, :through => :activityposts

  has_many :albums, :as => :albumable
  
  validates :title, presence: true
end
