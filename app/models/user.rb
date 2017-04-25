class User < ApplicationRecord
	belongs_to :organization

	has_secure_password
	validates :username, :displayname, :organization_id, presence: true
  validates_uniqueness_of :username
  validates :password, presence: true, :on => :create
  validates_confirmation_of :password, :on => :create
  
  ROLES = %w[admin staff manager accounting_clerk financial_officer banned]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  def is_valid?
    !roles.empty?
  end

  # User.authenticate('username123', 'password123')  # returns authenticated user or nil
  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
