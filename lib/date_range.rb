require 'date'

require_relative 'room'
require_relative 'reservation'
require_relative 'booker'
require_relative 'block'

module Hotel
  class DateRange
    attr_reader :start_time, :end_time, :date_range, :reservations

    def initialize(start_time:, end_time:, reservations: nil)
      @start_time = Date.parse(start_time.to_s)
      @end_time = Date.parse(end_time.to_s)
      @date_range = @end_time - @start_time
      @reservations = reservation || []

      if @end_time < @start_time
        raise ArgumentError, "End time can't be earlier than start time"
      end

    end

  end

end