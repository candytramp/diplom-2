class Role < ActiveRecord::Base
  has_paper_trail
  
  has_many :role_users

  validates :name, uniqueness: true, presence: true, length: {maximum: 32}
end
