require "date"

require_relative "room"
require_relative "booker"
require_relative "block"

module Hotel
  class Reservation
    attr_reader :check_in, :check_out, :total_cost, :room_number

    def initialize(check_in:, check_out:, room_number: 0)
      @check_in = Date.parse(check_in.to_s)
      @check_out = Date.parse(check_out.to_s)
      @total_cost = (@check_out.mjd - @check_in.mjd) * 200
      # mjd method: source - stack overflow.com
      @room_number = room_number || 0

      if @check_out <= @check_in
        raise ArgumentError, "End time can't be earlier than or equal to start time"
      end

    end

  end

end