require 'test/unit'
require_relative '../scripts/beautiful_dates2'

class TestBeautifulDates2 < Test::Unit::TestCase
	def test_slash
		assert_equal("12/12/12".beautify, ["12th of December 0012", "December the 12th 0012"])
	end

	def test_dash
		assert_equal("12-12-12".beautify, ["12th of December 0012", "December the 12th 0012"])
	end

	def test_dot
		assert_equal("12.12.12".beautify, ["12th of December 0012", "December the 12th 0012"])
	end

	def test_combination
		assert_equal("12-12.12".beautify, ["12th of December 0012", "December the 12th 0012"])
	end

	def test_time_dot_now
		assert_equal(Time.now.beautify, ["18th of December 2013", "December the 18th 2013"])
	end

end