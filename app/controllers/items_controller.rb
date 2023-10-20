class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index  # indexアクションを定義した
  end

  def new
    @item = Item.new
  end

  def create
    Tweet.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price)
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
