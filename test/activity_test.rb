require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_exists
    activity = Activity.new('Hike')

    assert_instance_of Activity, activity
  end

  def test_attributes
    activity = Activity.new('Hike')

    assert_equal 'Hike', activity.name
    assert_equal Hash.new, activity.participants
  end

  def test_can_add_participant_to_activity
    activity = Activity.new('Hike')
    activity.add_participant(name: 'Timo', amount: 5)

    assert_equal 'Hike', activity.name
    assert_equal 'Timo', activity.participants[:name]
    assert_equal 5, activity.participants[:amount]
  end

end
