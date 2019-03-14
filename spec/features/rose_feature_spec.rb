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

      context "Sulfuras, Hand of Ragnaros" do 
        
        before(:each) do 
          @items =[Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
          @gildedrose = GildedRose.new(@items)
        end 
  
        it "the name should not change" do 
          @gildedrose.update_quality()
          expect(@items[0].name).to eq "Sulfuras, Hand of Ragnaros"
        end 

        it "can be changed into a string" do 
          expect(@items[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 0, 80"
        end
  
        it "doesn't have a sellin date or decrease in quality" do 
          @gildedrose.update_quality()
          expect(@items[0].sell_in).to eq 0
          expect(@items[0].quality).to eq 80
        end
      end

      context "Backstage passes" do 
        before(:each) do
          @items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20 )]
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
          items2 = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20 )]
          rose = GildedRose.new(items2)
          11.times { rose.update_quality() }
          expect(items2[0].sell_in).to eq -1 
          expect(items2[0].quality).to eq 0
        end 
  
        it "increase only to 50 when sell_in about 10 and quality is 49" do 
          @items2 = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49 )]
          @gildedrose2 = GildedRose.new(@items2)
          @gildedrose2.update_quality()
          expect(@items2[0].sell_in).to eq 9
          expect(@items2[0].quality).to eq 50
        end 
  
        it 'increase only to 50 when the sell_in is 5 and quality is 49' do 
          @items3 = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49 )]
          @gildedrose3 = GildedRose.new(@items3)
          @gildedrose3.update_quality();
          expect(@items3[0].sell_in).to eq 4
          expect(@items3[0].quality).to eq 50
        end
      end
    end
  end