require_relative "reservation"
require_relative "booker"
require_relative "block"

module Hotel
  class Room
    attr_reader :number, :bookings

    def initialize(number:, booking: nil)
      @number = number
      @bookings = booking || []

      if @number.class != Integer 
        raise ArgumentError, "room number must be an interger"
      elsif (1..20).include?(@number) == false
        raise ArgumentError, "room number must be within the 1 to 20 range"
      end

    end

    # would create a add_room method if the hotel would expand rooms in the future

  end

end