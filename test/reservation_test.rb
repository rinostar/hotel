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

    it "calculates total cost correctly" do
      check_in = "2019-09-01"
      check_out = "2019-09-04"
      expect(Hotel::Reservation.new(check_in: check_in, check_out: check_out).total_cost).must_equal 600
    end

    it "sets room number to 0 if not provided" do
      check_in = "2019-09-01"
      check_out = "2019-09-04"
      expect(Hotel::Reservation.new(check_in: check_in, check_out: check_out).room_number).must_equal 0
    end

    it "is set up for specific attributes and data types" do
      check_in = "2019-09-01"
      check_out = "2019-09-04"
      reservation = Hotel::Reservation.new(check_in: check_in, check_out: check_out)
      [:check_in, :check_out, :total_cost, :room_number].each do |prop|
        expect(reservation).must_respond_to prop
      end
  
      expect(reservation.check_in).must_be_kind_of Date
      expect(reservation.check_out).must_be_kind_of Date
      expect(reservation.total_cost).must_be_kind_of Integer
      expect(reservation.room_number).must_be_kind_of Integer
    end

  end

end