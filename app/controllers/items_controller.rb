class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index  # indexアクションを定義した
  end

  def new
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
