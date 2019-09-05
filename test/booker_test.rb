require_relative "test_helper"

describe "Booker class" do 
  
  describe "Booker initialization" do
    
    it "is an instance of Booker" do 
      expect(Hotel::Booker.new).must_be_kind_of Hotel::Booker
    end

    it "has an array of all the Room instances" do 
      expect(Hotel::Booker.new.rooms).must_be_kind_of Array
      expect(Hotel::Booker.new.rooms.length).must_equal 20
      expect(Hotel::Booker.new.rooms.first).must_be_kind_of Hotel::Room
      expect(Hotel::Booker.new.rooms.last).must_be_kind_of Hotel::Room
    end

  end

  # describe make_reservation

  # describe search_reservation

end
    