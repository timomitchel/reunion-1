require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new('house')

    assert_instance_of Reunion, reunion
  end

  def test_it_can_hold_attributes
    reunion = Reunion.new('house')

    assert_equal 'house', reunion.location
    assert_equal [], reunion.activities
  end

  def test_add_activities
    reunion = Reunion.new('house')
    activity_1 = Activity.new('hike')
    activity_2 = Activity.new('hang')

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)

    assert_equal 2, reunion.activities.length
    assert_equal 'hike', reunion.activities[0].name
  end
end
