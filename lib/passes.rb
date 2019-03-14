require 'normal_item'

class Passes < NormalItem

  def initialize(sell_in, quality)
    super("Backstage passes to a TAFKAL80ETC concert", sell_in, quality)
  end

  def update_item
    new_quality = @quality + quality_change
    @quality = new_quality > 50 ? 50 : new_quality
    @sell_in -= 1
    concert_over?
  end 

  def quality_change
    if @sell_in < 6
      3
    elsif @sell_in < 11
      2
    else
      1
    end
  end

  def concert_over?
    if sell_in < 0 
      @quality = 0 
    end
  end

end 