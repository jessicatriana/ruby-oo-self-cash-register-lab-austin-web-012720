require 'pry'

class CashRegister

    attr_accessor :total, :discount, :quantity

    @@all = []
   
    def initialize(discount= nil, quantity= 0)
        @total = 0
        @discount = discount
        @quantity = quantity
        @item_list = []
    end

    def add_item(title, price, quantity= 1)
       @total += price * quantity
       @last_price = price
       @last_quantity = quantity
# check in to quanity.times method isntead
       while quantity > 0 do
         @item_list << title
         quantity -= 1
       end

    end

    def discount
        @discount
    end

    def apply_discount
      if @discount
        @total = @total - (@discount * 10)
        return "After the discount, the total comes to $#{@total}."
      else
        return "There is no discount to apply."
        @total -= @discount
      end
    end

    def items
      @item_list
    end

    def void_last_transaction
     @total -= @last_price
     @item_list.pop(@last_quantity)
     if @item_list == []
        @total = 0.0
     end
     
     
    end
end
