require_relative "room"
require_relative "reservation"
require_relative "block"

module Hotel
  class Booker
    attr_reader :rooms

    def initialize
      @rooms = []
      (1..20).each do |n|
        @rooms << Room.new(number: n)
      end

    end

    # def make_reservation
    # def search_reservation

  end

end