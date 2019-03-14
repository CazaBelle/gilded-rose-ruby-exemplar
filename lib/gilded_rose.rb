class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
        item.update_item
    end
  end
end

