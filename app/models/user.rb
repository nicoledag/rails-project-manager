class User < ApplicationRecord

  has_many :projects
  has_many :clients, through: :projects

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password

  def capitalize
    self.username.capitalize
  end

end
