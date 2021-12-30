class Array
  def reverse_each_with_index &block
    to_enum.with_index.reverse_each &block
  end
end

def stock_picker(stock_prices)
  buy_stock = {
    price: 0,
    index: nil
  }

  sell_stock = {
    price: 0,
    index: nil
  }

  max_profit = 0

  stock_prices.reverse_each_with_index do |sell_price, sell_index|
    possible_buys = stock_prices[0..sell_index]
    possible_buys.each_with_index do |buy_price, buy_index|
      profit = sell_price - buy_price
      if profit > max_profit
        max_profit = profit
        buy_stock[:index] = buy_index
        buy_stock[:price] = buy_price
        sell_stock[:index] = sell_index
        sell_stock[:price] = sell_price
      end
    end
  end
  [buy_stock[:index], sell_stock[:index]]
end

test_array = [17,3,6,9,15,8,6,1,10]
p stock_picker(test_array)