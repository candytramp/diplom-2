class User < ActiveRecord::Base
  has_paper_trail
  
  has_many :role_users

  validates :login, uniqueness: true, presence: true, length: {maximum: 32}
  
  serialize :data
end
