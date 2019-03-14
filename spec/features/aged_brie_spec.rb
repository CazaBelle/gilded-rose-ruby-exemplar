require 'aged_brie'

describe AgedBrie do
        
  before(:each) do 
    @items = [AgedBrie.new(0, 5)]
    @gildedrose = GildedRose.new(@items)
  end 

  it "the name should not change" do 
    @gildedrose.update_quality()
    expect(@items[0].name).to eq "Aged Brie"
  end 

  it "can be changed into a string" do 
    expect(@items[0].to_s).to eq "Aged Brie, 0, 5"
  end

  it "has a quality that increases over time" do 
    @items2 = [Item.new("Aged Brie", 5, 5)]
    @gildedrose2 = GildedRose.new(@items2)
    @gildedrose2.update_quality
    expect(@items2[0].quality).to eq 6
  end 

  it "value increases by 2 after sellin" do 
    @gildedrose.update_quality()
    expect(@items[0].quality).to eq 7
    expect(@items[0].sell_in).to eq -1
  end 

  it "quality can never be greater then 50" do 
    25.times { @gildedrose.update_quality() }
    expect(@items[0].quality).to be <= 50
    expect(@items[0].sell_in).to equal -25
  end
end