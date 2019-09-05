require_relative 'test_helper'

describe "DateRange class" do

  describe "DateRange initialization" do 
    
    it "is an instance of DateRange" do
      start_time = "2019-09-01"
      end_time = "2019-09-04"
      expect(Hotel::DateRange.new(start_time: start_time, end_time: end_time)).must_be_kind_of Hotel::DateRange
    end

    it "calculate date range correctly" do
      start_time = "2019-09-01"
      end_time = "2019-09-04"
      @date_range = Hotel::DateRange.new(start_time: start_time, end_time: end_time)
      expect(@date_range.instance_variable_get(:@date_range)).must_equal 3
    end

    it "raises an ArgumentError when end time is earlier than start time" do
      start_time = "2019-09-04"
      end_time = "2019-09-01"
      expect {Hotel::DateRange.new(start_time: start_time, end_time: end_time)}.must_raise ArgumentError
    end

  end

end