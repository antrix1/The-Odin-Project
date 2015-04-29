class Post < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 8}

  belongs_to :user
  has_many :comments
end
