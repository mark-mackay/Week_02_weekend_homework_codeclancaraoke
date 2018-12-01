# require_relative('./song')
# require_relative('./guest')
# require_relative('./room')

class Karaoke_Bar
  attr_reader :name, :rooms, :money, :guests

  def initialize(name, rooms = [], guests = [], money = 0.0)
    @name = name
    @rooms = rooms
    @guests = guests
    @money = money
  end

  def count_bar_rooms
    return @rooms.length
  end

  def add_rooms_to_bar(car_rooms)
    @rooms << car_rooms
  end
  def add_people_to_bar(car_people)
    @guests << car_people
  end
  def remove_people_from_bar(car_people)
    @guests.delete(car_people)
  end

  def count_money
    total = @rooms.reduce(0) {| sum, room | sum + room[:float] }
    return total
  end

end
