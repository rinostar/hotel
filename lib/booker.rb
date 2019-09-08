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
          @rooms << Room.new(number: n)
          n += 1
        end

      end
    
    end

    def all_rooms
      return @rooms  
    end

    def make_reservation(check_in:, check_out:)
      start_date = Date.parse(check_in.to_s)
      end_date = Date.parse(check_out.to_s)

      @rooms.each do |room|
        room_bookings = room.instance_variable_get(:@bookings)
        
        if room_bookings.length == 0
          new_reservation = Reservation.new(check_in: start_date, check_out: end_date, room: room)
          room_bookings << new_reservation
          return new_reservation

        else
          no_overlap = 0
          room_bookings.each do |b|
            existing_check_in = b.instance_variable_get(:@check_in)
            existing_check_out = b.instance_variable_get(:@check_out)

            if end_date <= existing_check_in || start_date >= existing_check_out
              no_overlap += 1
            end

            if no_overlap == room_bookings.length
              new_reservation = Reservation.new(check_in: start_date, check_out: end_date, room: room)
              room_bookings << new_reservation
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
        room_bookings = room.instance_variable_get(:@bookings)

        if room_bookings.length != 0
          room_bookings.each do |b|
            existing_check_in = b.instance_variable_get(:@check_in)
            existing_check_out = b.instance_variable_get(:@check_out)
            if search_date.between?(existing_check_in, existing_check_out) == true
              search_result << b
            end

          end

        end

      end

      return search_result

    end

  end

end