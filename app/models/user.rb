class User < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :image_dates, dependent: :destroy



  has_many :evaluations, class_name: "RSEvaluation", as: :source

  has_reputation :votes, source: {reputation: :votes, of: :image_dates}, aggregated_by: :sum


end
