require_relative 'reservation'
require_relative 'date_range'
require_relative 'booker'
require_relative 'block'

module Hotel
  class Room
    attr_reader :number, :cost
    attr_accessor :status, :reservations

    def initialize(number:, status: 'AVAILABLE', reservation: nil)
      @number = number
      @cost = 200 # dollar per night
      @status = status
      @reservations = reservation || []

      if @number.class != Integer 
        raise ArgumentError, "room number must be an interger"
      elsif (1..20).include?(@number) == false
        raise ArgumentError, "room number must be within the 1 to 20 range"
      end

      if ['AVAILABLE', 'UNAVAILABLE'].include?(@status) == false
        raise ArgumentError, "invaid input for room status"
      end
    end

    # def add_reservation(reservation)
    #   @reservations << reservation
    # end

  end
end