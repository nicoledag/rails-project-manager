class Project < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :client, optional: true

  validates :name, :description, presence: true
  
  has_many :comments

end
