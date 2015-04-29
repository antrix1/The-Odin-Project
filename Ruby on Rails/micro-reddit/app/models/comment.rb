class Comment < ActiveRecord::Base
  validates :body, :user_id, presence: true, length: {minimum: 1}
  belongs_to :post
  belongs_to :user
end
