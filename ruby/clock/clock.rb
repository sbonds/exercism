# Implement a clock that only stores hours and minutes. No second or date info is needed.
#
# For example:
#   Clock.new(hour: 18, minute: 7)
#
# Creates a clock for 6:07pm.
#
# Clocks can be added or subtracted. Hours or minutes can be added or subtracted and these should be handled appropriately.
#
# Thoughts on how to do this:
# 1) Use an epoch-based approach: minutes past midnight
# 2) Store hours/minutes independently
# 3) Use a date/time library and omit the date part
#
# The epoch approach works well for other uses, I'll try that one first.
#

class Clock
  attr_reader :minutes_past_midnight

  def initialize(hour: 0, minute: 0)
    @minutes_past_midnight = hour * 60 + minute
  end

  def to_s
    normalize_minutes
    hours = minutes_past_midnight / 60
    minutes = minutes_past_midnight % 60
    format('%0.2d:%0.2d', hours, minutes)
  end

  def +(_other_clock)
    Clock.new(minute: minutes_past_midnight + _other_clock.minutes_past_midnight)
  end

  def -(_other_clock)
    Clock.new(minute: minutes_past_midnight - _other_clock.minutes_past_midnight)
  end

  private

  def normalize_minutes
    @minutes_past_midnight += 24 * 60 if minutes_past_midnight < 0
    @minutes_past_midnight = minutes_past_midnight % (24 * 60)
  end
end
