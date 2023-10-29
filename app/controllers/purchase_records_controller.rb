class PurchaseRecordsController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @form_object = FormObject.new # ←新しくインスタンスを生成するnewメソッド
  end

  # def new
  #   @form_object = Formobject.new
  # end

  def create
    @item = Item.find(params[:item_id])
    @form_object = FormObject.new(purchase_record_params)
    if @form_object.valid?
      pay_item
      @form_object.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def purchase_record_params
    params.require(:form_object).permit(:zip,:prefecture_id,:city,:street,:building,:phone).merge(user_id:current_user.id,item_id:@item.id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:@item.price,# purchase_record_params#[:price],  # 商品の値段
        card: purchase_record_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      # orderテーブルにはpriceないので、上記記述ではpriceが取得できないはず itemテーブルから引っ張る
      )
    end
  

end
