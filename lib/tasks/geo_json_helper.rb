require 'json'
require 'open-uri'
require 'pp'
# Load Geo Json file into a hash
class GeoJsonHhelper
  def get_local_json_file(file_name)
    file_relative_path = File.dirname(__FILE__)
    relative_path = "#{file_relative_path}/#{file_name}"
    json = File.read(relative_path)
    JSON.parse(json)
  end

  def get_remote_json_file(url_file_path)
    JSON.parse open(url_file_path).read      
  end
end
