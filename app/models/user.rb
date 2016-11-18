class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :quotes
  has_many :likes

  def liked?(quote)
    quote.likes.where(user: self).any?
    
  end
end
