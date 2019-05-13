class Comment < ApplicationRecord

  belongs_to :project

  validates :content, presence: true


  def format_date_created
      self.created_at.strftime("%m/%d/%Y")
  end


end
