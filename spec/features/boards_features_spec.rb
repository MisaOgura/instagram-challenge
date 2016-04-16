require 'rails_helper'

feature 'Boards:' do
  context 'No board has been added' do
    scenario 'prompts user to create a board' do
      visit boards_path
      expect(page).to have_content 'No board has been added'
      expect(page).to have_link 'Create new board'
    end
  end
end
