# Implement a method #stock_picker that takes in an array of stock prices, one
# for each hypothetical day. It should return a pair of days representing the
# best day to buy and the best day to sell. Days start at 0.

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

# Test - Success if console prints true
puts stock_picker([17,3,6,9,15,8,6,1,10]) == [1,4]
