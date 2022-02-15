# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  def setup
    @ip = '8.8.8.8'
    @xml = File.read('./fixtures/data.xml')
    stub_request(:get, "ip-api.com/xml/#{@ip}").to_return(body: @xml)
  end

  def test_data_ip
    ip_meta = Ipgeobase.lookup(@ip)
    assert_equal ip_meta.city, 'Ashburn'
    assert_equal ip_meta.country, 'United States'
    assert_equal ip_meta.countryCode, 'US'
    assert_equal ip_meta.lat, 39.03
    assert_equal ip_meta.lon, -77.5
  end
end
