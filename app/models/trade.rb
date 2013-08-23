class Trade < ActiveRecord::Base
  attr_accessible :bepoint, :buy_date, :buy_price, :qty, :stock

  has_many :remarks
  belongs_to :portfolio

  def amount
  	qty.to_f*buy_price.to_f
  end

  def tbr
    # sprintf "%.2f", 
    amount*portfolio.brokerage.to_f/100
    
  end

  def tamount
    amount + tbr
  end

  def minstoploss
    buy_price.to_f - (portfolio.mriskstock/100)*buy_price.to_f
  end

  def be_point
    buy_price.to_f + (portfolio.totalextraround/100)*buy_price.to_f
  end

  def totalpl
  	last_amount.to_f - amount.to_f
  end

  def iqty
    (portfolio.capital.to_f)*(portfolio.mriskcapital.to_f)/100/buy_price.to_f
  end

  def risk

    if bepoint.nil?
      (be_point - minstoploss)*qty
    else
      (be_point - bepoint.to_f)*qty
    end    
  end

  def riskperstock
    risk.to_f/tamount.to_f*100  
  end

  def riskperport
    risk.to_f/portfolio.capital.to_f*100
  end



  def last_price
  	StockQuote::Stock.quote("#{self.stock}").last.to_f
  end

  def last_amount
  	last_price.to_i*qty.to_f
  end

end
