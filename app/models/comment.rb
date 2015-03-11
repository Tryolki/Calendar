class Comment < ActiveRecord::Base
  belongs_to :image_date

  has_reputation :comm_rep, source: :user, aggregated_by: :sum

end
