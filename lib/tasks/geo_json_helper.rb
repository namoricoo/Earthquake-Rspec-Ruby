require 'json'
require 'open-uri'
require 'net/http'
require 'uri'
require 'pp'
# Load Geo Json file into a hash
class GeoJsonHhelper
  def initialize
    @geo_json_hash = {}
  end

  def get_local_json_file(file_name)
    file_relative_path = File.dirname(__FILE__)
    relative_path = "#{file_relative_path}/#{file_name}"
    json = File.read(relative_path)
    @geo_json_hash = JSON.parse(json)
  end

  def get_remote_json_file(url_file_path)
    @geo_json_hash = JSON.parse open(url_file_path).read
  end

  def get_remote_geo_json(url_geo_json_file_path)
    earthquake_array_of_hashes = []
    response = get_remote_file_http_response(url_geo_json_file_path)
    if response.code == '200'
      result = JSON.parse(response.body)
      earthquake_array_of_hashes = get_array_earthquake_hash(result)
    else
      puts 'Error trying to establish a connection to remote host'
      earthquake_array_of_hashes
    end
  end

  def get_remote_file_http_response(url_geo_json_file_path)
    uri = URI.parse(url_geo_json_file_path)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.request(request)
  end

  def get_array_earthquake_hash(geo_json_data)
    earthquake_array_of_hashes = []
     geo_json_data.each do |key, value|
       (earthquake_array_of_hashes = value) if key == 'features'
     end
     earthquake_array_of_hashes
  end
end
