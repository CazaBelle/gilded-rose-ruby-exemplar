require 'normal_item'

class AgedBrie < NormalItem
    def initialize(sell_in, quality)
      super("Aged Brie", sell_in, quality)
    end

    def quality_change
      @sell_in < 11 ? 2 : 1
    end
  end