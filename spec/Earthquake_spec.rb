require_relative '../lib/tasks/earthquake.rb'
require_relative 'spec_helper.rb'
# Test Load File into an Array
describe Earthquake do
  it 'transforms input into hash {latitude: number,longitude: number}' do
    # [longitude,latitude,depth]
    input_array = [127.4955, 5.1454, 80.11]
    output_hash = { latitude: 5.1454, longitude: 127.4955 }
    earthquake = Earthquake.new
    earthquake.set_coordinates(input_array)
    earthquake.get_location_hash.should == output_hash
  end
  it 'Get the from value in the slider' do
    input = '0.2;7'
    output = 0.2
    earthquake.get_from_value(input).should == output
  end
end
