require 'normal_item'

describe NormalItem do 
  
  before(:each) do 
    @items = [NormalItem.new("foo", 10, 20)]
    @gildedrose = GildedRose.new(@items)
  end 

  it "does not change the name" do
    @gildedrose.update_quality()
      expect(@items[0].name).to eq "foo"
  end
  
  it "can be changed into a string" do 
    expect(@items[0].to_s).to eq "foo, 10, 20"
  end

  it "the sellin should reduce by 1 each day" do
    @gildedrose.update_quality()
      expect(@items[0].sell_in).to eq 9
  end 

  it "checks that items update correctly multiple times" do 
    @gildedrose.update_quality()
    @gildedrose.update_quality()
      expect(@items[0].sell_in).to eq 8 
  end

  # it "quality should reduce by 2 after sellin date" do 
  #   @items2 = [NormalItem.new("bar", 0, 10)]
  #   @gildedrose2 = GildedRose.new(@items)
  #   @gildedrose2.update_quality()
  #     expect(@items2[0].quality).to eq 8
  # end 

  it "value should never fall below 0 even after sellin" do 
    14.times { @gildedrose.update_quality() }
      expect(@items[0].quality).to be >= 0
  end 
end