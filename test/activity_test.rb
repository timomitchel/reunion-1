require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require "pry"

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
    activity.add_participant('Timo', 5)

    assert_equal 'Hike', activity.name
    assert_equal ({"Timo"=>5}), activity.participants
  end

  def test_can_hold_multiple_participants
    activity = Activity.new('Hike')
    activity.add_participant('Timo', 5)
    activity.add_participant( 'Katy', 10)
    activity.add_participant('Erika', 0)

    assert_equal ["Timo", "Katy", "Erika"], activity.participants.keys
    assert_equal [5, 10, 0], activity.participants.values
  end

  def test_total_cost
    activity = Activity.new('Hike')
    activity.add_participant('Timo', 5)
    activity.add_participant( 'Katy', 10)
    activity.add_participant('Erika', 0)

    assert_equal 15, activity.total_cost
  end

  def test_split_cost
    activity = Activity.new('Hike')
    activity.add_participant('Timo', 5)
    activity.add_participant( 'Katy', 10)
    activity.add_participant('Erika', 0)

    assert_equal 5, activity.split_cost
  end

  def test_amount_owed
    activity = Activity.new('Hike')
    activity.add_participant('Timo', 5)
    activity.add_participant( 'Katy', 10)
    activity.add_participant('Erika', 0)

    assert_equal ({"Timo"=>0, "Katy"=>-5, "Erika"=>5}), activity.amount_owed
  end

end
