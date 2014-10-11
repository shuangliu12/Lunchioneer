class Admin::KitchensController < ApplicationController
  before_filter :authorize!

  def show
    @kitchen = Kitchen.find(params[:id])
    @review = Review.new
    @reviews = Review.where(kitchen: @kitchen)
  end
end
