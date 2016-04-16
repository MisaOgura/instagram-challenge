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
    before { Board.create(name: 'My Board') }
    scenario 'displays a link to an existing board' do
      visit boards_path
      expect(page).not_to have_content 'No board has been added'
      expect(page).to have_link 'My Board'
    end
  end

  context 'When a user visits the page' do
    scenario 'user can create a board' do
      create_board
      expect(current_path).to eq boards_path
      expect(page).to have_link 'My Board'
    end
  end

  context 'Viewing a board' do
    let!(:board){ Board.create(name: 'My Board')}
    scenario 'user can view an existing board' do
      visit boards_path
      click_link 'My Board'
      expect(current_path).to eq board_path(board)
      expect(page).to have_content 'My Board'
    end
  end

  context 'Editing a board' do
    let!(:board){ Board.create(name: 'My Board')}
    scenario 'user can edid an existing board' do
      visit board_path(board)
      click_link 'Edit My Board'
      fill_in 'Name', with: 'Your Board'
      click_button 'Update'
      expect(current_path).to eq board_path(board)
      expect(page).not_to have_content 'My Board'
      expect(page).to have_content 'Your Board'
    end
  end
end
