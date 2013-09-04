class UsersController < ApplicationController

	before_filter :authenticate_user!
  def index

  	    @users = User.all
    	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @users }
    end


  end

  def show
  	@user= User.find(params[:id])
  	authorize! :read, @user

  end

  def new
  end

  def edit
  end
end
