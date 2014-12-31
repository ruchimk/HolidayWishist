class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :search

  def self.friends_items(user)
    Item.where(user_id: user.friend_ids[params: :friend_id])
  end



  def get_etsy_id
    string = self.etsy_url
    regex = /\d+/ #regular expression for finding integers
    numbers = string.scan(regex)
    self[:etsy_id] = numbers[0] #first number in array is the id
  end

  def set_attributes_from_etsy
    etsy_data = get_etsy_data
    listing = etsy_data["results"][0]
    self[:name] = listing["title"].truncate(240)
    self[:description] = listing["description"].truncate(240)
  end

  def get_etsy_data
    HTTParty.get("https://openapi.etsy.com/v2/listings/#{self.etsy_id}?api_key=#{Rails.application.secrets.etsy_api_key}")
  end


end
