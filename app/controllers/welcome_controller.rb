class WelcomeController < ApplicationController
  def index
    @kitchens = Kitchen.all
  end
end
