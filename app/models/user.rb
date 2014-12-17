class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :items

  has_many :friendships, {dependent: :destroy}
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def not_friends
    # User.all - self.friends - [self]
    already_friends_ids = self.friend_ids
    User.all.reject do |user|
      already_friends_ids.include?(user.id) || self.id == user.id
    end
  end

  # def friends_ids
  #   friend_ids = []
  #   friend_ids << self.friend_ids
  # end

  # def friends_items
  #   @items.where(friends_ids)
  # end

end

