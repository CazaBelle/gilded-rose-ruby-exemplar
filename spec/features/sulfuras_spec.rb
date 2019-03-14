require 'sulfuras'
    
    describe Sulfuras do 
        
        before(:each) do 
          @items =[Sulfuras.new(0, 80)]
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
  