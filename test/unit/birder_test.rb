require 'test_helper'

class BirderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "birder num_birds" do
    matthew = birders(:matthew)
    assert_equal matthew.num_birds, 2
    andrew = birders(:andrew)
    assert_equal andrew.num_birds, 1
  end
end
