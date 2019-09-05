require_relative 'room'
require_relative 'date_range'
require_relative 'booker'
require_relative 'block'

module Hotel

  class Reservation
    attr_reader :room, :date_range, :total_cost

    def initialize(room_number:, date_range:)
      @room_number = room_number
      @date_range = date_range
      @total_cost = 200 * @date_range

      # if nil - no avaliable room 
      # if < 1 - not valid range

    end

  end

end