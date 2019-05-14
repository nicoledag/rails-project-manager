class User < ApplicationRecord

  has_many :projects
  has_many :clients, through: :projects

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password

   #First or Create: Finds the first record with the given attributes, or creates a record with the attributes if one is not found.
  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.username = auth_hash["info"]["nickname"]
    end
  end

  def capitalize
    self.username.capitalize
  end

end
