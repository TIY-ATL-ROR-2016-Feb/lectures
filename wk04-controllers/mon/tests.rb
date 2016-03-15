require "minitest/autorun"
require "pry"

require "./the_thing"

class ApiTests < MiniTest::Test
  def setup
    @github = Github.new
    @example = [
      {
        "author" => {
          "cookies" => "whatever",
          "login" => "testing"
        }
      }
    ]
  end

  def test_that_we_can_get_a_username
    user = @example.first
    assert_equal @github.get_username(user), "testing"
    # assert @github.get_username(@example) == "testing"
  end
end
