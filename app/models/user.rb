class User < ActiveRecord::Base
  has_paper_trail
  
  has_many :role_users
  accepts_nested_attributes_for :role_users, allow_destroy: true

  validates :login, uniqueness: true, presence: true, length: {maximum: 32}
  validates_associated :role_users
  
  serialize :data
  
  def is_admin?()
    self.role_users.any?{ |x| x.role.name == 'admin' }
  end
end
