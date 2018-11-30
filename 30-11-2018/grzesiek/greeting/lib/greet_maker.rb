class GreetMaker

  def initialize(name)
    @name = name
  end

  attr_reader :name

  def make_greet
    name.empty? && raise(NameNilError)
    name == 'Frank' && raise(WrongNameError)

    "No siema, #{name}!"
  end
end

class NameNilError < StandardError; end
class WrongNameError < StandardError; end