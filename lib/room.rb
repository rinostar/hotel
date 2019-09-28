require "date"

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
      elsif @number < 1
        raise ArgumentError, "room number can not be less than 1"
      end

    end

    def price
      return 200
    end 

    # would create a add_room method if the hotel would expand rooms in the future

  end

end