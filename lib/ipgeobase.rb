# frozen_string_literal: true

require_relative "ipgeobase/version"
require "happymapper"
require "ipgeobase/address"

module Ipgeobase
  def self.lookup(ip)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip}")
    xml_data = Net::HTTP.get(uri)
    Address.parse(xml_data, single: true)
  end
end
