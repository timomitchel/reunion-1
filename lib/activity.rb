class Activity

  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = Hash.new
  end

  def add_participant(participant)
    participant.each do |key, value|
      @participants[key] = value
    end
  end
end
