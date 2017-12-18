class Admins::UsersController < ApplicationController
  before_action :signed_in_user, only: [:search, :destroy]
  before_action :admin_required, only: [:search, :destroy]
  
  def index
  	#binding.pry
  	@q = User.ransack(params[:q])
  	@user = @q.result
  end

  def search
  	index #不能去除?
  	render :index
  end

end
