class Item < ActiveRecord::Base
  belongs_to :user

  def self.friends_items(user)
    Item.where(user_id: user.friend_ids[params: :friend_id])
  end

end
