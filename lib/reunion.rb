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
    activity_1_amounts.merge(activity_2_amounts) do |key, first_val, second_val|
      first_val + second_val
    end
  end

  def activity_1_amounts
    activity_totals[0]
  end

  def activity_2_amounts
    activity_totals[1]
  end

  def activity_totals
    @activities.map do |activity|
      activity.amount_owed
    end
  end
end
