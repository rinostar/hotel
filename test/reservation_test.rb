require_relative "test_helper"

describe "Reservation class" do 

  describe "Reservation initialization" do 

    it "is an instance of reservation" do
      check_in = "2019-09-01"
      check_out = "2019-09-04"
      expect(Hotel::Reservation.new(check_in: check_in, check_out: check_out)).must_be_kind_of Hotel::Reservation
    end

    it "raises an ArgumentError when end time is earlier than start time" do
      check_in = "2019-09-04"
      check_out = "2019-09-01"
      expect {Hotel::Reservation.new(check_in: check_in, check_out: check_out)}.must_raise ArgumentError
    end

    it "sets room to nil if not provided" do
      check_in = "2019-09-01"
      check_out = "2019-09-04"
      expect(Hotel::Reservation.new(check_in: check_in, check_out: check_out).room).must_equal nil
    end

    it "is set up for specific attributes and data types" do
      check_in = "2019-09-01"
      check_out = "2019-09-04"
      reservation = Hotel::Reservation.new(check_in: check_in, check_out: check_out)
      [:check_in, :check_out, :room].each do |prop|
        expect(reservation).must_respond_to prop
      end
  
      expect(reservation.check_in).must_be_kind_of Date
      expect(reservation.check_out).must_be_kind_of Date
      expect(reservation.room).must_be_nil
    end

  end

  describe "total_cost method" do 

    it "returns the total cost for a specific reservation" do 
      sample_1 = Hotel::Reservation.new(check_in: "1998-03-30", check_out: "1998-04-02", room: Hotel::Room.new(number: 1))
      sample_2 = Hotel::Reservation.new(check_in: "1998-05-01", check_out: "1998-05-31", room: Hotel::Room.new(number: 2))
    
      expect(sample_1.total_cost).must_equal 600
      expect(sample_2.total_cost).must_equal 6000

    end

  end

end