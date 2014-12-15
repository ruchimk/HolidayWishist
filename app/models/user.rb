class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :items

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def not_friends
    already_friends_ids = self.friends.map {|friend| friend.id }
    not_friends = []
    User.all.each do |user|
      not_friends << user unless already_friends_ids.include?(user.id) || self.id == user.id
    end
    not_friends
  end
end
