class Portfolio < ActiveRecord::Base
  attr_accessible :capital, :name, :brokerage, :taxslipage, :totalextraround, :mriskstock, :mriskcapital, :mcats

  has_many :trades
  belongs_to :user

  def invested
  	sum = nil
  	 trades.all.each do |t|
  	 	sum = t.amount.to_f + sum.to_f	 	
  	 end	
  	sum
  end

  def current_port_value
  	sum = nil
  		trades.all.each do |t|
  			sum = t.last_amount.to_f + sum.to_f
  		end
  	sum		
  end

  def port_profit_loss
  	current_port_value.to_f - invested.to_f  	
  end 

  
end
