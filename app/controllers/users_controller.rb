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
  end

  def new
  end

  def edit
  end
end
