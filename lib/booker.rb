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

    # def make_reservation
    # def search_reservation

  end

  def all_rooms
    return @rooms
  end

end