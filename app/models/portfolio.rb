class Portfolio < ActiveRecord::Base
  attr_accessible :capital, :name

  has_many :trades

  def invested
  	sum = nil
  	 trades.all.each do |t|
  	 	sum = t.amount.to_i + sum.to_i	 	
  	 end	
  	sum
  end

  def current_port_value
  	sum = nil
  		trades.all.each do |t|
  			sum = t.last_amount.to_i + sum.to_i
  		end
  	sum		
  end

  def port_profit_loss
  	current_port_value.to_i - invested.to_i  	
  end

end
