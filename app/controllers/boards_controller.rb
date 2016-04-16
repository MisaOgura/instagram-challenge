class BoardsController < ApplicationController

  def index
    all_boards
  end

  def new
    new_board
  end

  def create
    create_board
    redirect_to boards_path
  end

  def show
    current_board
  end

  def edit
    current_board
  end

  def update
    update_current_board
    redirect_to board_path
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

  def all_boards
    @boards = Board.all
  end

  def new_board
    @board = Board.new
  end

  def current_board
    @board = Board.find(params[:id])
  end

  def create_board
    @board = Board.new(board_params)
    @board.save
  end

  def update_current_board
    @board = current_board.update(board_params)
  end
end
