class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  after_commit :remove_previously_stored_image, on: :update
  validates :title, presence: true, length: {minimum: 3, maximum:20}
  validates :description, presence: true, length: {minimum: 10, maximum: 10000}
  validates :user_id, presence: true
  
end
