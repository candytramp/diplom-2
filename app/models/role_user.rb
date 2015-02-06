class RoleUser < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :user
  belongs_to :role
  
  serialize :value
  
  validates :user_id, presence: true
  validates :role_id, presence: true

  def is_admin?()
    self.role.name == 'admin' 
  end
end
