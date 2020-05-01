class ToppagesController < ApplicationController
  def index
    @reviews = Review.order(id: :desc).page(params[:page]).per(5)
  end
end
