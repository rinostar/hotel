require_relative "test_helper"

describe "Room class" do 
  
  describe "Room initialization" do
    
    it "is an instance of Room" do 
      expect(Hotel::Room.new(number: 1)).must_be_kind_of Hotel::Room
    end

    it "throws an argument error with a non-integer input for number" do 
      expect { Hotel::Room.new(number: 1.1) }.must_raise ArgumentError
      expect { Hotel::Room.new(number: 'hi') }.must_raise ArgumentError
    end

    it "throws an argument error with a integer less than 1" do
      expect { Hotel::Room.new(number: -1) }.must_raise ArgumentError
      expect { Hotel::Room.new(number: 0) }.must_raise ArgumentError
    end

    it "sets bookings to an empty array if not provided" do
      expect(Hotel::Room.new(number: 3).bookings).must_be_kind_of Array
      expect(Hotel::Room.new(number: 3).bookings.length).must_equal 0
    end

    it "is set up for specific attributes and data types" do
      room = Hotel::Room.new(number: 5)
      [:number, :bookings].each do |prop|
        expect(room).must_respond_to prop
      end
  
      expect(room.number).must_be_kind_of Integer
      expect(room.bookings).must_be_kind_of Array
    end

  end

end