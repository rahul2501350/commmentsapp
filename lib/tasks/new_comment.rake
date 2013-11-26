

  task winner: :environment do
  	comment = Comment.new
  	comment.name = "sdf"
  	comment.save
    puts "Comment: #{Comment.last.name}"
  end

  task remark: :environment do

  	require "market_beat"

  	Trade.all.each do |t|

	  	# t = Trade.find(2)
	  	r = t.remarks.new
	  	r.remark = "Sample Remark"
	  	s = StockQuote::Stock.quote("#{t.stock}")
	  	ss = StockQuote::Stock.history("#{t.stock}")
	  	# r.op = ss[1]
	  	r.cp = s.last
	  	r.date = Date.current

	  	r.op = s.open
		# r.op = MarketBeat.opening_price 



	  	r.save
	    # @trade.buy_price = @stock2.last
	  end
  end




  
  task portfolioid: :environment do
  	Trade.all.each do |t|
  		t.portfolio_id = 1
  		t.save
  	end	
  end

  task fillstockdata: :environment do
    
  end
  