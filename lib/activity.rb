require "pry"

class Activity

  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = Hash.new
  end

  def add_participant(name, amount)
    @participants.store(name, amount)
  end

  def total_cost
    @participants.values.sum
  end

end
