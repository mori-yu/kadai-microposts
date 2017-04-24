class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :reverses_of_post_relationship, class_name: 'PostRelationship', foreign_key: 'fav_id', dependent: :destroy
  has_many :favers, through: :reverses_of_post_relationship, source: :fav
end
