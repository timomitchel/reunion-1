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

  def split_cost
    total_cost / @participants.values.length
  end

  def amount_owed
    @participants.keys.reduce({}) do |hash, name|
      hash.store(name, split_cost - @participants[name])
      hash
    end
  end
end
