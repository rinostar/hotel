require "date"

require_relative "room"
require_relative "reservation"
require_relative "block"

module Hotel
  class Booker
    attr_reader :inventory, :rooms, :reservations

    def initialize(inventory:)
      @inventory = inventory
      @rooms = []
      @reservations = []

      if @inventory.class != Integer
        raise ArgumentError, "inventory has to be an integer"
      elsif @inventory < 1 
        raise ArgumentError, "inventory can't be less than 1"
      else
        n = 1
        @inventory.times do
          @rooms << Hotel::Room.new(number: n)
          n += 1
        end

      end
    
    end

    def available_rooms(check_in:, check_out:)
      start_date = Date.parse(check_in.to_s)
      end_date = Date.parse(check_out.to_s)
      available_rooms = []

      availability = 0
      @rooms.each do |room|
        if room.bookings == nil
          available_rooms << room

        else
          no_overlap = 0
          room.bookings.each do |booking|
            if end_date <= booking.check_in || start_date >= booking.check_out
              no_overlap += 1  
            end
          end

          if no_overlap == room.bookings.length
            available_rooms << room
            availability += 1
          end
        end
      end

      if availability == 0
        raise ArgumentError, "There are no available room"
      else
        return available_rooms
      end

    end

    def make_reservation(check_in:, check_out:)
      start_date = Date.parse(check_in.to_s)
      end_date = Date.parse(check_out.to_s)

      @rooms.each do |room|
        
        if room.bookings.length == 0
          new_reservation = Reservation.new(check_in: start_date, check_out: end_date, room: room)
          room_bookings << new_reservation
          return new_reservation

        else
          no_overlap = 0
          room.bookings.each do |booking|

            if end_date <= booking.check_in || start_date >= booking.check_out
              no_overlap += 1
            end

            if no_overlap == room.bookings.length
              new_reservation = Reservation.new(check_in: start_date, check_out: end_date, room: room)
              room.bookings << new_reservation
              return new_reservation
            else
              raise ArgumentError, "There are no available rooms for this date range"
            end

          end
          
        end

      end
      
    end

    def search_reservation(date:)
      search_date = Date.parse(date.to_s)
      search_result = []

      @rooms.each do |room|

        if room.bookings.length != 0
          room.bookings.each do |booking|
    
            if search_date.between?(booking.check_in, booking.check_out) == true
              search_result << booking
            end

          end

        end

      end

      return search_result

    end

  end

end