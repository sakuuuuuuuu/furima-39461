class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index  # indexアクションを定義した
     @items = Item.all  
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
  def item_params
    params.require(:item).permit(:image,:name, :explaination, :category_id, :condition_id,:del_fee_id,:prefecture_id,:days_until_shipping_id,:price,).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
