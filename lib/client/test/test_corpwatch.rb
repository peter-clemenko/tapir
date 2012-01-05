$:.unshift(File.dirname(__FILE__))

require '../../ear/ear_api_keys'
require '../../ear/ear_constants'
require '../corpwatch.rb'
require 'test/unit'

class TestCorpwatch < Test::Unit::TestCase
  
	def test_corpwatch_search_acme
		x = Corpwatch::CorpwatchService.new
		corps = x.search "acme"
		assert corps.count == 61, "Wrong count, should be 61, is #{corps.count}"
		assert corps.first.name == "ACME COMMUNICATIONS INC", "Failed: #{corps[0].company_name} was not ACME COMMUNICATIONS INC"
	end

	def test_corpwatch_search_rapid7
		x = Corpwatch::CorpwatchService.new
		corps = x.search "rapid7"		
		assert corps.count == 1, "Wrong count, should be 1, is #{corps.count}"
		assert corps.first.name == "Rapid7 LLC", "Failed: #{corps[0].company_name} was not Rapid7 LLC"
	end

	def test_corpwatch_search_tenable
		x = Corpwatch::CorpwatchService.new
		corps = x.search "tenable"
		assert corps.count == 1, "Wrong count, should be 1, is #{corps.count}"
		assert corps.first.name == "TENABLE NETWORK SECURITY INC", "Failed: #{corps[0].company_name} was not TENABLE NETWORK SECURITY INC"
	end

end

