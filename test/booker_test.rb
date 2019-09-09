require_relative "test_helper"

describe "Booker class" do 
   
  describe "Booker initialization" do
    
    it "throws argument erros for invalid inventory input" do
      expect{Hotel::Booker.new(inventory: '20')}.must_raise ArgumentError
      expect{Hotel::Booker.new(inventory: 0)}.must_raise ArgumentError
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
  
  describe "all_rooms method" do 
    it "must return an array of Room instances matching with the inventory number" do
      expect(Hotel::Booker.new(inventory: 33).all_rooms).must_be_kind_of Array
      expect(Hotel::Booker.new(inventory: 33).all_rooms.first).must_be_kind_of Hotel::Room
      expect(Hotel::Booker.new(inventory: 33).all_rooms.last).must_be_kind_of Hotel:: Room
      expect(Hotel::Booker.new(inventory: 33).all_rooms.length).must_equal 33
    end

  end

  describe "available_rooms method" do
    before do
      @new_booker = Hotel::Booker.new(inventory: 2)
    end
    
    it "throws ArgumentError for invalid check_in and check_out dates" do
      expect{ @new_booker.make_reservation(check_in: "2019-09-01", check_out: "2019-09-01") }.must_raise ArgumentError
      expect{ @new_booker.make_reservation(check_in: "2019-09-02", check_out: "2019-09-01") }.must_raise ArgumentError
    end
    
    it "throws ArgumentError when there is no available rooms during the given date range" do 
      rooms = @new_booker.rooms
      rooms[0].bookings << Hotel::Reservation.new(check_in: "2019-09-01", check_out: "2019-09-04", room: 1)
      rooms[1].bookings << Hotel::Reservation.new(check_in: "2019-09-02", check_out: "2019-09-05", room: 2)

      expect{ @new_booker.make_reservation(check_in: "2019-09-02", check_out: "2019-09-04") }.must_raise ArgumentError
      expect{ @new_booker.make_reservation(check_in: "2019-09-01", check_out: "2019-09-05") }.must_raise ArgumentError
      expect{ @new_booker.make_reservation(check_in: "2019-08-30", check_out: "2019-09-03") }.must_raise ArgumentError
      expect{ @new_booker.make_reservation(check_in: "2019-09-03", check_out: "2019-09-07") }.must_raise ArgumentError
    end

    it "will add room with no bookings to the avaliable rooms search result" do 
      search = @new_booker.available_rooms(check_in: "2019-09-08", check_out: "2019-09-09")
      expect(search.length).must_equal 2
    end

    it "returns an array of all Room instances avaliable during the given date range" do 
      rooms = @new_booker.rooms
      rooms[0].bookings << Hotel::Reservation.new(check_in: "2019-09-01", check_out: "2019-09-04", room: 1)
      rooms[1].bookings << Hotel::Reservation.new(check_in: "2019-09-02", check_out: "2019-09-05", room: 2)
    
      search_1 = @new_booker.available_rooms(check_in: "2019-09-04", check_out: "2019-09-07")
      search_2 = @new_booker.available_rooms(check_in: "2019-08-30", check_out: "2019-09-01")

      expect(search_1).must_be_kind_of Array
      expect(search_2).must_be_kind_of Array

      expect(search_1.length).must_equal 1
      expect(search_2.length).must_equal 2

      expect(search_1[0]).must_be_kind_of Hotel::Room
      expect(search_2.first).must_be_kind_of Hotel::Room
      expect(search_2.last).must_be_kind_of Hotel::Room
    end

  end
  
  describe "make_reservation method" do
    before do
      @new_booker = Hotel::Booker.new(inventory: 2)
    end

    it "throws ArgumentError for invalid check_in and check_out dates" do
      expect{ @new_booker.make_reservation(check_in: "2019-09-01", check_out: "2019-09-01") }.must_raise ArgumentError
      expect{ @new_booker.make_reservation(check_in: "2019-09-02", check_out: "2019-09-01") }.must_raise ArgumentError
    end

    it "throws ArgumentError when there is no available rooms during the given date range" do 
      rooms = @new_booker.rooms
      rooms[0].bookings << Hotel::Reservation.new(check_in: "2019-09-01", check_out: "2019-09-04", room: 1)
      rooms[1].bookings << Hotel::Reservation.new(check_in: "2019-09-02", check_out: "2019-09-05", room: 2)

      expect{ @new_booker.make_reservation(check_in: "2019-09-02", check_out: "2019-09-04") }.must_raise ArgumentError
      expect{ @new_booker.make_reservation(check_in: "2019-09-01", check_out: "2019-09-05") }.must_raise ArgumentError
      expect{ @new_booker.make_reservation(check_in: "2019-08-30", check_out: "2019-09-03") }.must_raise ArgumentError
      expect{ @new_booker.make_reservation(check_in: "2019-09-03", check_out: "2019-09-07") }.must_raise ArgumentError
    end

    it "creats a Resveration instance with the correct Room instance(s)" do 
      rooms = @new_booker.rooms
      rooms[0].bookings << Hotel::Reservation.new(check_in: "2019-09-01", check_out: "2019-09-04", room: 1)
      rooms[1].bookings << Hotel::Reservation.new(check_in: "2019-09-02", check_out: "2019-09-05", room: 2)
      new_reservation = @new_booker.make_reservation(check_in: "2019-09-04", check_out: "2019-09-07")
      reserved_room = new_reservation.room
      updated_room_bookings = reserved_room.bookings

      expect(new_reservation).must_be_kind_of Hotel::Reservation
      expect(reserved_room.number).must_equal 1
      expect(updated_room_bookings.length).must_equal 2

    end

  end
  
  describe "search_reservation method" do 
    before do
      @new_booker = Hotel::Booker.new(inventory: 2)
    end

    it "throws ArgumentError when there is no available rooms during the given date range" do 
      rooms = @new_booker.rooms
      rooms[0].bookings << Hotel::Reservation.new(check_in: "2019-09-07", check_out: "2019-09-08", room: 1)
      rooms[1].bookings << Hotel::Reservation.new(check_in: "2019-09-08", check_out: "2019-09-09", room: 2)

      expect{ @new_booker.make_reservation(check_in: "2019-09-02", check_out: "2019-09-08") }.must_raise ArgumentError
  
    end

    it "creates an array of all reservations on that date" do
      rooms = @new_booker.rooms
      rooms[0].bookings << Hotel::Reservation.new(check_in: "2019-10-20", check_out: "2019-10-25", room: 1)
      rooms[1].bookings << Hotel::Reservation.new(check_in: "2019-09-30", check_out: "2019-10-20", room: 2)
      result_1 = @new_booker.search_reservation(date: '2019-10-03')
      result_2 = @new_booker.search_reservation(date: '2019-10-20')
      result_3 = @new_booker.search_reservation(date: '2019-10-26')

      expect(result_1).must_be_kind_of Array
      expect(result_2).must_be_kind_of Array
      expect(result_3).must_be_kind_of Array

      expect(result_1.length).must_equal 1
      expect(result_2.length).must_equal 2
      expect(result_3.length).must_equal 0

      expect(result_1[0]).must_be_kind_of Hotel::Reservation
      expect(result_2[1]).must_be_kind_of Hotel::Reservation
    end

  end

end
    