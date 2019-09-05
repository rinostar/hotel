require_relative 'test_helper'

describe "Reservation class" do 

  describe "Reservation initialization" do 

    it "is an instance of reservation" do 
      expect(Hotel::Reservation.new(room_number: 1, date_range: 3)).must_be_kind_of Hotel::Reservation
    end

  end


end