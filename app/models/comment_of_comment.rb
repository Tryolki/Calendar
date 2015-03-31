class CommentOfComment < ActiveRecord::Base
  belongs_to :comment
end
