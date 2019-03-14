require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
   
      context "normal items" do 
        before(:each) do 
          @items = [Item.new("foo", 10, 20)]
          @gildedrose = GildedRose.new(@items)
        end 
  
        it "does not change the name" do
          @gildedrose.update_quality()
            expect(@items[0].name).to eq "foo"
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
  
        it "quality should reduce by 2 after sellin date" do 
          11.times { @gildedrose.update_quality() }
            expect(@items[0].quality).to eq 8
        end 
    
        it "value should never fall below 0 even after sellin" do 
          14.times { @gildedrose.update_quality() }
            expect(@items[0].quality).to be >= 0
        end 
      end

      context "Aged Brie" do
        before(:each) do 
          @items = [Item.new("Aged Brie", 0, 5)]
          @gildedrose = GildedRose.new(@items)
        end 
  
        it "the name should not change" do 
          @gildedrose.update_quality()
          expect(@items[0].name).to eq "Aged Brie"
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
  
    end
end