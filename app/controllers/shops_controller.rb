class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end
  
  def show
    @shop=Shop.find(params[:id])
    @reviews = @shop.reviews
    session[:shop_id] = @shop.id
  end

  def new
    @shop = current_user.shops.build
  end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      flash[:success] = "店舗を作成しました"
      redirect_to @shop
    else
      flash.now[:danger] = "店舗作成に失敗しました"
      render :new 
    end
  end

  def destroy
    @shop = current_user.shops.find(params[:id])
    @shop.destroy
    flash[:success] = "店舗を削除しました"
    redirect_to shops_path
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :kind, :address, :holiday, :image)
  end
end
