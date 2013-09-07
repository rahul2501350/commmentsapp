class TradesController < ApplicationController

  # GET /trades
  # GET /trades.json
  load_and_authorize_resource :portfolio
  load_and_authorize_resource :trade, :through => :portfolio
 
  def index
    # @trades = Trade.all
    @portfolio = Portfolio.find(params[:portfolio_id])
    @trades = @portfolio.trades.all
   


     symbol = "LSE.L"
     @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol]

    # @data = YahooFinance.quotes(["BVSP", "USDJPY=X"], [:ask, :bid, :last_trade_date])



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trades }
      format.js
    end
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
    @portfolio = Portfolio.find(params[:portfolio_id])
    @trade = @portfolio.trades.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trade }
      format.js
    end
  end

  # GET /trades/new
  # GET /trades/new.json
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @trade = @portfolio.trades.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trade }
      format.js
    end
  end

  # GET /trades/1/edit
  def edit
    @portfolio = Portfolio.find(params[:portfolio_id])
    @trade = @portfolio.trades.find(params[:id])
  end

  # POST /trades
  # POST /trades.json
  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    @trade = @portfolio.trades.new(params[:trade])
    @stock2 = StockQuote::Stock.quote("#{params[:trade][:stock]}")
    @trade.buy_price = @stock2.last
    
    respond_to do |format|
      if @trade.save
        format.html { redirect_to [@portfolio, @trade], notice: 'Trade was successfully created.' }
        format.json { render json: @trade, status: :created, location: @trade }
      else
        format.html { render action: "new" }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /trades/1
  # PUT /trades/1.json
  def update
    @portfolio = Portfolio.find(params[:portfolio_id])
    @trade = @portfolio.trades.find(params[:id])

    # @trade = Trade.new(params[:trade])
    @trade.assign_attributes(params[:trade])
    @stock2 = StockQuote::Stock.quote("#{params[:trade][:stock]}")
    @trade.buy_price = @stock2.last

    respond_to do |format|
      # if @trade.update_attributes(params[:trade])
      if @trade.save
        format.html { redirect_to [@portfolio, @trade], notice: 'Trade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    @trade = @portfolio.trades.find(params[:id])
    @trade.destroy

    respond_to do |format|
      format.html { redirect_to portfolio_trades_url(@portfolio) }
      format.json { head :no_content }
    end
  end
end
