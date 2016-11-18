class Quote < ApplicationRecord
	validates :content, presence: true, length: {maximum: 140}
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> {order(created_at: :desc )}
  has_many :likes

end
