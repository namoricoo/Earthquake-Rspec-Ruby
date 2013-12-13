# Earthquake class
class Earthquake
  def initialize
    initialize_earthquake_hash
  end

  def initialize_earthquake_hash
    @earthquake_hash = {}
    @earthquake_hash[:latitude] = ''
    @earthquake_hash[:longitude] = ''
  end

  def set_field(field_symbol,value)
    @earthquake_hash[field_symbol] = value
  end

  def get_field(field_symbol)
    @earthquake_hash[field_symbol]
  end

  def format_location_hash(input_array)   
   {latitude:input_array[1],longitude: input_array[0]}    
  end
end