class Permission < ActiveRecord::Base
has_and_belongs_to_many :roles
  
  scope :sorted, order('permissions.id ASC')
end
