
require 'faker'

FactoryGirl.define do
  factory :item do
    title            { Faker::Hacker.noun}
    image_url        { Faker::Internet.url }
  end
end
