require "addressable/uri"

class Address
  include HappyMapper

  tag 'query'
  element :status, String, tag: 'status'
  element :country, String, tag: 'country'
  element :countryCode, String, tag: 'countryCode'
  element :region, String, tag: 'region'
  element :city, String, tag: 'city'
  element :zip, Integer, tag: 'zip'
  element :lat, Float, tag: 'lat'
  element :lon, Float, tag: 'lon'
  element :timezone, String, tag: 'timezone'
  element :org, String, tag: 'org'
  element :as, String, tag: 'as'
  element :query, String, tag: 'query'
end
