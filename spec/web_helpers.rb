def create_board
  visit boards_path
  click_link 'Create new board'
  fill_in 'Name', with: 'My Board'
  click_button 'Create'
end
