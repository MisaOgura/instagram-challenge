class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.save
    redirect_to boards_path
  end

  def show
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
