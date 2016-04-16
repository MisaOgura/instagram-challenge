def create_board
  visit boards_path
  click_link 'Create new board'
  fill_in 'Name', with: 'My Board 1'
  click_button 'Create board'
end
