class Weather
  include HTTParty

  base_uri "http://api.openweathermap.org/data/2.5/group?appid=4122e656dc75ed86c90dde6ba95fbcd1"
  format :json

  #call the api with HTTParty and parse the JSON response 
  def self.call list_ids
    response = HTTParty.get(base_uri + '&id=' + list_ids)
    body = JSON.parse(response.body)
    list = body["list"]
  end

  #call the api with HTTParty and parse the JSON response 
  def self.callj list_ids
    response = HTTParty.get(base_uri + '&id=' + list_ids)
    body = JSON.parse(response.body)
    list = body["list"]
  end


require 'csv'
require 'json'



  #call the api with HTTParty and parse the JSON response 
  def self.callc list_ids
    response = HTTParty.get(base_uri + '&id=' + list_ids)

   hash = JSON.parse(response.body)



  res =  CSV.generate do |csv|
  #headers = hash.first.keys
  #csv << headers
  hash["list"].each do |item|
    #headers =item.first.keys
    #csv << headers
    values = item.values
    printable_values = Array.new
    values.each do |value|

      printable_values << value.to_s.gsub(/\[|\]/,'').gsub(/"/,'\'')

    end

    csv << printable_values

  end


  end

  return res 

end
end