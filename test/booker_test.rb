require_relative "test_helper"

describe "Booker class" do 
  
  describe "Booker initialization" do
    
    it "throws argument erros for invalid inventory input" do
      expect{Hotel::Booker.new('20')}.must_raise ArgumentError
      expect{Hotel::Booker.new(0)}.must_raise ArgumentError
    end
    
    before do
      @new_booker = Hotel::Booker.new(inventory: 20)
    end
    
    it "is an instance of Booker" do 
      expect(@new_booker).must_be_kind_of Hotel::Booker
    end

    it "has an empty array for reservations" do 
      expect(@new_booker.reservations).must_be_kind_of Array
      expect(@new_booker.reservations.length).must_equal 0
    end

    it "has an array of Room instances matching with the inventory number" do
      expect(@new_booker.rooms).must_be_kind_of Array
      expect(@new_booker.rooms.first).must_be_kind_of Hotel::Room
      expect(@new_booker.rooms.last).must_be_kind_of Hotel::Room
      expect(@new_booker.rooms.length).must_equal 20
    end

  end

  # describe make_reservation

  # describe search_reservation

end
    