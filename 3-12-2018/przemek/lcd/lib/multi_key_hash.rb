
class MultiKeyHash
  attr_accessor :hash

  def initialize
    @hash = { 
      [0, 2, 3] => '._.'
    }
  end

  def [](key)
    return if find_key(key).nil?
    hash[find_key(key).first]
  end

  def []=(key, value)
    key_hash = find_key(key)
    key = [key]
    key = key_hash.first unless key_hash.nil?
    hash[key] = value
  end

  def add_key_to_value(value, new_key)
    hash.key(value) << new_key 
  end

  # private

  def find_key(key_val)
    hash.find do |k, v|
      k.include?(key_val)
    end
  end
end

h = MultiKeyHash.new

h[0] = '...'
h[1] = 'xDd'
h.add_key_to_value('...', 6)
p h[0]
p h.find_key(0).first
p h[1]
p h.hash