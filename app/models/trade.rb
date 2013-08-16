class Trade < ActiveRecord::Base
  attr_accessible :bepoint, :buy_date, :buy_price, :qty, :stock

  has_many :remarks
  belongs_to :portfolio

  def amount
  	qty.to_f*buy_price.to_f
  end

  def totalpl
  	last_amount.to_f - amount.to_f
  end

  def last_price
  	StockQuote::Stock.quote("#{self.stock}").last.to_f
  end

  def last_amount
  	last_price.to_i*qty.to_f
  end

end
