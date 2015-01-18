class RoleUser < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :user
  belongs_to :role
  
  serialize :value
  
  validates :user, presence: true
  validates :role, presence: true
end
