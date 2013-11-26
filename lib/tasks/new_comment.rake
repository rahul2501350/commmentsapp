

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

task greet: :environment do
   puts "Hello world"
end



  
  task portfolioid: :environment do
  	Trade.all.each do |t|
  		t.portfolio_id = 1
  		t.save
  	end	
  end

  task fillstockdata: :environment do

    require 'csv'

      csv_text = File.read('lib/tasks/nse_sym_name_sector.csv')
      csv = CSV.parse(csv_text, :headers => true)
      n = 0 
      csv.each do |row|   
        n=n+1
        symbol_csv = row['SYMBOL']
        fullname_csv = row['FULLNAME']
        sector_csv = row['SECTOR']

        # puts "#{n}----- #{row['SYMBOL']}----- #{row['FULLNAME']} -------- #{row['SECTOR']}"

        s = Stock.new
        s.symbol = symbol_csv
        s.fullname = fullname_csv
        s.sector = sector_csv
        s.save

        puts "#{n}-----saved---- #{symbol_csv}"
      end  
  
  end

  task destroystocks: :environment do
    stocks = Stock.all
    stocks.each do |stock|
      stock.destroy
    end
  end
  