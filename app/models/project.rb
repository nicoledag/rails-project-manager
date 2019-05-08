class Project < ApplicationRecord

  belongs_to :user
  belongs_to :client
  has_many :comments

  validates :name, :description, :client, presence: true

  def format_date
    target_completion_date.strftime("%m/%d/%Y")
  end

end
