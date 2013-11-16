class PortfoliosController < ApplicationController

  load_and_authorize_resource :user
  load_and_authorize_resource :portfolio, :through => :user

  # GET /portfolios
  # GET /portfolios.json
  def index

    # @user = User.find(params[:user_id])
    @user = current_user
    # @user = User.find(params[:id] == -1 ? current_user_id : params[:id])
    @portfolios = @user.portfolios.all

    unless @portfolios.first == nil
      @portfolio = @portfolios.first  

        unless @portfolio.trades.all.empty?
          @trades = @portfolio.trades.all  
        end
    end


    
    
    # authorize! :read, @portfolios
    

    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @portfolios }
    end
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
    # @user = User.find(params[:user_id])
    @user = current_user
    @user.id = current_user.id
    @portfolio = @user.portfolios.find(params[:id])
    @trades = @portfolio.trades.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @portfolio }
      format.js
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.json
  def new
    # @user = User.find(params[:user_id])
    @user = current_user
    @portfolio = @user.portfolios.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portfolio }
      format.js
    end
  end

  # GET /portfolios/1/edit
  def edit
    @user = User.find(params[:user_id])
    @portfolio = @user.portfolios.find(params[:id])
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @user = User.find(params[:user_id])
    @portfolio = @user.portfolios.new(params[:portfolio])

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to user_portfolios_path(@user), notice: 'Portfolio was successfully created.' }
        format.json { render json: @portfolio, status: :created, location: user_portfolio_path(@user, @portfolio) }
      else
        format.html { render action: "new" }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /portfolios/1
  # PUT /portfolios/1.json
  def update
    @user = User.find(params[:user_id])
    @portfolio = @user.portfolios.find(params[:id])

    respond_to do |format|
      if @portfolio.update_attributes(params[:portfolio])
        format.html { redirect_to user_portfolios_path(@user), notice: 'Portfolio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @user = User.find(params[:user_id])
    @portfolio = @user.portfolios.find(params[:id])
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to user_portfolios_url(@user) }
      format.json { head :no_content }
    end
  end

  def new_view
    respond_to do |format|               
      format.js
    end  
  end



end
