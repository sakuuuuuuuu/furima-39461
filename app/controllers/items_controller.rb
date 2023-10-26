class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]


  def index  # indexアクションを定義した
     @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

 def show
   @item = Item.find(params[:id])
 end

def edit
   @item = Item.find(params[:id])
   contributor_confirmation
end

def update
  @item = Item.find(params[:id])

  # redirect_to item_path
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit, status: :unprocessable_entity
  end

end

  private
  def item_params
    params.require(:item).permit(:image,:name, :explaination, :category_id, :condition_id,:del_fee_id,:prefecture_id,:days_until_shipping_id,:price,).merge(user_id: current_user.id)
  end


  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  

    # if redirect_to root_path unless current_user == @item.user
    # elsif redirect_to new_user_session_path unless user_signed_in?
    # end
  end  

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end


# <h3>編集する</h3>
# <%= form_with(model: @tweet, local: true) do |form| %>
#   <%= form.text_field :name, placeholder: "Nickname" %>
#   <%= form.text_field :image, placeholder: "Image Url" %>
#   <%= form.text_area :text, placeholder: "text", rows: "10" %>
#   <%= form.submit "SEND" %>
# <% end %>

