# frozen_string_literal: true

require "test_helper"

class IpgeobaseTest < Minitest::Test
  def setup
    @ip = '8.8.8.8'
    @xml = '<?xml version="1.0" encoding="UTF-8"?>
            <query>
                <status>success</status>
                <country>United States</country>
                <countryCode>US</countryCode>
                <region>VA</region>
                <regionName>Virginia</regionName>
                <city>Ashburn</city>
                <zip>20149</zip>
                <lat>39.03</lat>
                <lon>-77.5</lon>
                <timezone>America/New_York</timezone>
                <isp>Google LLC</isp>
                <org>Google Public DNS</org>
                <as>AS15169 Google LLC</as>
                <query>8.8.8.8</query>
            </query>'
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
