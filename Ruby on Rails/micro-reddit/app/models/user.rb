class User < ActiveRecord::Base
  validates :name, :presence => true, length: {minimum: 4, maximum: 10}

  has_many :posts
  has_many :comments, through: :posts
end
