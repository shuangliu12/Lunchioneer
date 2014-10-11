class Admin::KitchensController < ApplicationController
  before_filter :admin_authorize!

  def index
    @kitchens = Kitchen.all
  end

  def show
    @kitchen = Kitchen.find(params[:id])
    @review = Review.new
    @reviews = Review.where(kitchen: @kitchen)
  end

  def destroy
    @kitchen = Kitchen.find(params[:id])
    @kitchen.destroy
    flash[:success] = "You have successfully deleted your kitchen."
    redirect_to admin_kitchens_path
  end
end
