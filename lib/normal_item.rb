require 'item'

class NormalItem < Item

    def update_item
      new_quality = @quality + quality_change
      if new_quality < 0
        @quality = 0
      elsif new_quality > 50
        @quality = 50
      else
        @quality = new_quality
      end
      @sell_in -= 1
    end
  
    def quality_change
      @sell_in < 0 ? -2 : -1
    end
  end