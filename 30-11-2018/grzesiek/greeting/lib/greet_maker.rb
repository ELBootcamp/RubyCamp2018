class GreetMaker

  def initialize(name)
    @name = name
  end

  attr_reader :name

  def make_greet
    "No siema, #{name}!"
  end
end