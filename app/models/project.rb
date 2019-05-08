class Project < ApplicationRecord

  belongs_to :user
  belongs_to :client
  has_many :comments

  validates :name, :description, :client_id, presence: true




  def comments_attributes=(comments_attributes)
    comments_attributes.each do |i, comment_attributes|
      # raise params.inspect
      # @comment = Comment.find_or_create_by(content: comment_attributes[:content])
        # if @comment.project_id == nil
          self.comments.build(comment_attributes)
        # else
        #   self.comments.update(comment_attributes)
        # end
    end
  end

end
