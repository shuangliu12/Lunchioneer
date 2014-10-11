class Admin::UsersController < ApplicationController
  before_filter :admin_authorize!

  def index
    @users = User.all
  end
end
