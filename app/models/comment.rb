class Comment < ActiveRecord::Base
  belongs_to :image_date
  has_many :tags, dependent: :destroy
  has_many :comment_of_comments, dependent: :destroy
  has_reputation :comm_rep, source: :user, aggregated_by: :sum

end
