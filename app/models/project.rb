class Project < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :client, optional: true

  has_many :comments
end
