class NameGetter
  def initialize(name)
    @name = name
  end

  attr_reader :name

  def call
    name.empty? && raise(NameNilError)
    name == 'Janek' && raise(SomeError)

    "No siema, #{name}!"
  end
end

class SomeError < StandardError; end
class NameNilError < StandardError; end
