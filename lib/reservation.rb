require "date"

require_relative "room"
require_relative "booker"
require_relative "block"

module Hotel
  class Reservation
    attr_reader :check_in, :check_out, :total_cost, :room

    def initialize(check_in:, check_out:, room: nil)
      @check_in = Date.parse(check_in.to_s)
      @check_out = Date.parse(check_out.to_s)
      @total_cost = (@check_out - @check_in).to_i * 200
      @room = room || nil

      if @check_out <= @check_in
        raise ArgumentError, "End time can't be earlier than or equal to start time"
      end
   
    end

    def total_cost
      return @total_cost
    end

  end

end