class ItemsController < ApplicationController
  before_action :find_item, only: :order  # 「find_item」を動かすアクションを限定

  def index
    @items = Item.all
    ItemOrder.create(item_id: params[:id], user_id: current_user.id)
  end

  def order # 購入する時のアクションを定義
    redirect_to new_user_card_path and return unless current_user.card.present?
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
     amount: @item.price, # 商品の値段
     customer: customer_token, # 顧客のトークン
     currency: 'jpy' # 通貨の種類（日本円）
    )
     
    ItemOrder.create(item_id: params[:id], user_id: current_user.id) # 商品のid情報を「item_id」として保存す

    redirect_to root_path
  end
 
  private
 
  def find_item
    @item = Item.find(params[:id]) # 購入する商品を特定
  end

end
