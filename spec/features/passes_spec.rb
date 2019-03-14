require 'passes'
   
   describe Passes do 
      before(:each) do
        @items = [Passes.new( 10, 20 )]
        @gildedrose = GildedRose.new(@items)
      end   
      it "the name should not change" do 
        @gildedrose.update_quality()
        expect(@items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      end 
      it "can be changed into a string" do 
        expect(@items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 10, 20"
      end 
      it "value increases by 2 when they are 10 or less" do
        @gildedrose.update_quality()
        expect(@items[0].sell_in).to eq 9
        expect(@items[0].quality).to eq 22
      end   
      it "value increases by 3 when sellin is equal to or less then 5 day" do 
        6.times { @gildedrose.update_quality() }
        expect(@items[0].sell_in).to eq 4
        expect(@items[0].quality).to eq 33
      end   
      it "value becomes zero when sellin day 0" do
        items2 = [Passes.new(10, 20)]
        rose = GildedRose.new(items2)
        11.times { rose.update_quality() }
        expect(items2[0].sell_in).to eq -1 
        expect(items2[0].quality).to eq 0
      end   
      it "increase only to 50 when sell_in about 10 and quality is 49" do 
        @items2 = [Passes.new(10, 49)]
        @gildedrose2 = GildedRose.new(@items2)
        @gildedrose2.update_quality()
        expect(@items2[0].sell_in).to eq 9
        expect(@items2[0].quality).to eq 50
      end   
      it 'increase only to 50 when the sell_in is 5 and quality is 49' do 
        @items3 = [Passes.new( 5, 49 )]
        @gildedrose3 = GildedRose.new(@items3)
        @gildedrose3.update_quality();
        expect(@items3[0].sell_in).to eq 4
        expect(@items3[0].quality).to eq 50
      end
    end