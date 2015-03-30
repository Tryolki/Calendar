class ImageDate < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  has_reputation :votes, source: :user, aggregated_by: :sum

  validates :date, presence: true
end
