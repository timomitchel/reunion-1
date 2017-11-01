class Reunion

  attr_reader :location, :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end

  def total_owed
    h_1 = activity_totals[0]
    h_2 = activity_totals[1]
    h_1.merge(h_2) do |key, first_value, second_value|
      first_value + second_value
    end
  end

  def activity_totals
    @activities.map do |activity|
      activity.amount_owed
    end
  end
end
