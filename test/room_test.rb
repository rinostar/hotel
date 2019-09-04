require_relative 'test_helper'

describe "Room class" do 
  
  describe "Room instantiation" do
    
    it "is an instance of Room" do 
      expect(Hotel::Room.new(number: 1)).must_be_kind_of Hotel::Room
    end

    it "throws an argument error with a non-integer input for number" do 
      expect { Hotel::Room.new(number: 1.1) }.must_raise ArgumentError
      expect { Hotel::Room.new(number: 'hi') }.must_raise ArgumentError
    end

    it "throws an argument error with a integer input for number that's outside the 1 to 20 range" do
      expect { Hotel::Room.new(number: -1) }.must_raise ArgumentError
      expect { Hotel::Room.new(number: 0) }.must_raise ArgumentError
      expect { Hotel::Room.new(number: 21) }.must_raise ArgumentError
    end

    it "has a default status of 'AVAILABLE'" do
      expect(Hotel::Room.new(number: 3).status).must_equal 'AVAILABLE'
    end

    it "throws an argument error with an input for status that's not 'AVAILABLE' or 'UNAVAILABLE'" do 
      expect { Hotel::Room.new(number: 3, status: 'available') }.must_raise ArgumentError
    end

    it "sets reservations to an empty array if not provided" do
      expect(Hotel::Room.new(number: 3).reservations).must_be_kind_of Array
      expect(Hotel::Room.new(number: 3).reservations.length).must_equal 0
    end

    it "is set up for specific attributes and data types" do
      room = Hotel::Room.new(number: 5)
      [:number, :cost, :status, :reservations].each do |prop|
        expect(room).must_respond_to prop
      end
      
      expect(room.number).must_be_kind_of Integer
      expect(room.cost).must_be_kind_of Integer
      expect(room.status).must_be_kind_of String
      expect(room.reservations).must_be_kind_of Array
    end

  end

  # describe "add_reservation method" do
  #   before do
  #     @room = Hotel::Room.new(
  #       number: 5
  #     )
  #     @reservation = Hotel::Reservation.new(
  #       start_date: Date.today
  #       end_date: Date.todat + 3
  #     )
  #   end

  #   it "add_reservation method" do 
  #     expect(@room.reservations).wont_include @reservation
  #     previous = @room.reservations.length

  #     @room.add_reservation(@reservation)

  #     expect(@room.reservations).must_include @reservation
  #     expect(@room.reservations.length).must_equal previous + 1
  #   end
  # end

end