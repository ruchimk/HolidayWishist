# spec/features/user_can_add_friends.rb

feature 'User can add friends' do
  scenario 'they see Add Friend on the index page' do
    visit friendships_path

    click_link 'Add Friend'

    expect(page).to have_css '.addfriends', 'Add Friends'
  end
end



