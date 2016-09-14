def stock_picker(stocks)
  max_profit, buy, sell = 0

  (stocks.length).times do |i|
  	profit = stocks[i..-1].max - stocks[i]
  	if profit > max_profit
  		buy = i
  		sell = stocks.index(stocks[i..-1].max)
  		max_profit = profit
  	end
  end
  [buy,sell]
end
