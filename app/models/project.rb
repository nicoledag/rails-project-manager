class Project < ApplicationRecord

  belongs_to :user
  belongs_to :client
  has_many :comments

  validates :name, :description, :client, presence: true
  validate :target_date_cannot_be_greater_than_completion_date


  def self.order_newest
    self.order(created_at: :desc)
  end


  def self.complete
    # raise params.inspect
    self.where.not(completion_date: nil).order(created_at: :desc)
end

  def incomplete
    self.where(completion_date: nil)
  end


  def target_date_cannot_be_greater_than_completion_date
    if target_completion_date > completion_date
      errors.add(:target_completion_date, "can't be greater than completion date")
    end
  end

  def format_target_date
    if target_completion_date
      self.target_completion_date.strftime("%m/%d/%Y")
    end
  end

  def format_completed_date
    if completion_date
      self.completion_date.strftime("%m/%d/%Y")
    end
  end

end
