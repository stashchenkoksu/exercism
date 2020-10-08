require 'date'
class Meetup
  attr_reader :year, :month
  NUMERIC = {
    first: 1,
    second: 8,
    third: 15,
    fourth: 22,
    fifth: 29,
    last: -7,
    teenth: 13
  }.freeze

  DAYS = {
    Sunday: 0,
    Monday: 1,
    Tuesday: 2,
    Wednesday: 3,
    Thursday: 4,
    Friday: 5,
    Saturday: 6
  }.freeze

  def initialize(month, day)
    @year = year
    @month = month
  end

  def get_next_day(date, day_of_week)
    date + ((day_of_week - date.wday) % 7)
  end

  def day(week_day, count_day)
    date = Date.new(year, month, NUMERIC[count_day])
    date = get_next_day(date, DAYS[week_day])
  end
end
