require 'rails_helper'

feature 'Boards:' do
  context 'When no board has been added' do
    scenario 'prompts user to create a board' do
      visit boards_path
      expect(page).to have_content 'No board has been added'
      expect(page).to have_link 'Create new board'
    end
  end

  context 'When a board has been added' do
    before { Board.create(name: 'Board 1') }
    scenario 'displays a link to an existing board' do
      visit boards_path
      expect(page).not_to have_content 'No board has been added'
      expect(page).to have_link 'Board 1'
    end
  end

  context 'When a user visits the page' do
    scenario 'user can create a board' do
      create_board
      expect(current_path).to eq boards_path
      expect(page).to have_link 'My Board 1'
    end
  end

  context ' Viewing a board' do
    let!(:board){ Board.create(name: 'My Board 1')}
    scenario 'user can view an existing board' do
      visit boards_path
      click_link 'My Board 1'
      expect(current_path).to eq board_path(board)
      expect(page).to have_content 'My Board 1'
    end
  end
end
