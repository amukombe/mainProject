class Role < ActiveRecord::Base
has_and_belongs_to_many :permissions
  has_many :users
  
  validates_presence_of :title
  validates :description, :presence => true
end
