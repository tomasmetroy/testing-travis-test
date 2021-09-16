# frozen_string_literal: true

# Class to represent a hour, minute and second clock
class Clock
  def initialize(hour, minute, second)
    @hour = hour
    @minute = minute
    @second = second
  end

  def print_string
    "#{@hour.to_s.rjust(2, '0')}:#{@minute.to_s.rjust(2, '0')}:#{@second.to_s.rjust(2, '0')}"
  end

  def increment_seconds
    next_second = @second + 1
    @second = @second.eql?(59) ? 0 : next_second
    @second.eql?(0) ? true : false
  end

  def increment_minutes(raise_minutes)
    return unless raise_minutes

    next_minute = @minute + 1
    @minute = @minute.eql?(59) ? 0 : next_minute
    @minute.eql?(0) ? true : false
  end

  def increment_hours(raise_hours)
    return unless raise_hours

    next_hour = @hour + 1
    @hour = @hour.eql?(23) ? 0 : next_hour
  end

  def increment
    raise_minutes = increment_seconds
    raise_hours = increment_minutes(raise_minutes)
    increment_hours(raise_hours)
  end
end
