# ## Numeric: treat as time spans (minutes, hours and so on).
#
# Really dead simple implementation. Yet it can be useful for small scripts
# and prototypes and .irbrc, so I'm having it in my baggage.
#
# **Note**: implementation is really simple, like `month` is 30 days, `year`
# is 365 days, no timezones or stuff.
#
# Usage:
#
# ```ruby
# 10.minutes # 10*60
# # seconds, hours, days, weeks, months, years also work
# # as well as singular forms like:
# 1.hour # => 60*60
# ```
#
class Numeric
  def seconds
    self
  end

  def minutes
    self * 60
  end

  def hours
    self * 60.minutes
  end

  def days
    self * 24.hours
  end

  def weeks
    self * 7.days
  end

  def months
    self * 30.days
  end

  def years
    self * 365.days
  end

  alias second seconds
  alias minute minutes
  alias hour hours
  alias day days
  alias week weeks
  alias month months
  alias year years
end
