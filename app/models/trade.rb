class Trade < ActiveRecord::Base
  attr_accessible :bepoint, :buy_date, :buy_price, :qty, :stock

  has_many :remarks
  belongs_to :portfolio

  def amount
  	qty.to_i*buy_price
  end

  def totalpl
  	last_amount - amount
  end

  def last_price
  	StockQuote::Stock.quote("#{self.stock}").last
  end

  def last_amount
  	last_price.to_i*qty.to_i
  end

end
