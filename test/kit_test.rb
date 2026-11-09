require "minitest/autorun"
require_relative "../lib/gardusi_gustavo/kit"

class KitTest < Minitest::Test
  def test_answer
    assert_equal 42, GardusiGustavo::Kit.answer
  end
end
