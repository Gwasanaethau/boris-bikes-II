require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No bikes available' unless working_bikes?
    bikes.pop
  end

  def release_broken_bikes
    broken_bikes = bikes.select { |bike| !bike.working? }
    bikes.delete_if { |bike| !bike.working? }
    broken_bikes
  end

  def dock bike
    fail 'Docking station full' if full?
    bikes << bike
  end

  private

  attr_accessor :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.length >= capacity
  end

  def working_bikes?
    bikes.any? { |bike| bike.working? }
  end
end
