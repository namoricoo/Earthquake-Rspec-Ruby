require_relative '../lib/tasks/earthquake.rb'
require_relative 'spec_helper.rb'
# Test Load File into an Array
describe Earthquake do
  it 'transforms input into hash {latitude: number,longitude: number}' do
    # [longitude,latitude,depth]
    input = [127.4955, 5.1454, 80.11]
    output = {latitude: 5.1454,longitude: 127.4955}
    Earthquake.new.format_location_hash(input_array).should == output
  end
end
