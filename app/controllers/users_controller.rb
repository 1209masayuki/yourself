class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @itemorders = ItemOrder.all
    @user = User.find(current_user.id)

    if @user.card
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      card = Card.find_by(user_id: current_user.id)
      # redirect_to new_card_path and return unless card.present?
      customer = Payjp::Customer.retrieve(card.customer_token)
      @card = customer.cards.first
      @user = User.find(current_user.id)
    end
    
  end

  def destroy
    @user = User.find(params[:id])
    return redirect_to action: :index if @user.destroy 
  end

  private
  

end