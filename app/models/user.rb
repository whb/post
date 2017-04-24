class User < ApplicationRecord
	belongs_to :organization

	has_secure_password
	validates :username, :displayname, :organization_id, presence: true
  validates_uniqueness_of :username
  validates :password, presence: true, :on => :create
  validates_confirmation_of :password
  
end
