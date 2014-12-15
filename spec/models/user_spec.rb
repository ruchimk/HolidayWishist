require 'rails_helper'

describe User do
  subject(:user) { User.create!(email: 'user@example.com', password: 'password') }
  let(:not_friend) { User.create!(email: 'not_friend@example.com', password: 'password') }
  let(:friend) { User.create!(email:'friend@example.com' , password: 'password') }

  before :each do
     user.friends << friend
  end

  describe 'not_friends' do
    it 'returns users that the current_user is not friends with' do
     # verify
      expect(user.not_friends).to eq [not_friend]
      # teardown is handled for you by RSpec
    end
  end

  describe 'friends' do
    it 'returns users that the current_user is friends with' do
      # verify
      expect(user.friends).to eq [friend]
    end
  end
end
