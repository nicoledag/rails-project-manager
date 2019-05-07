class Project < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :client, optional: true

  validates :name, :description, presence: true

  has_many :comments


  def comments_attributes=(comments_attributes)
    comments_attributes.each do |i, comment_attributes|
      # raise params.inspect
      @comment = Comment.find_or_create_by(content: comment_attributes[:content])
        if @comment.content.present?
          self.comments.update(comment_attributes)
        else
          self.comments.build(comment_attributes)
        end
    end
  end

end
