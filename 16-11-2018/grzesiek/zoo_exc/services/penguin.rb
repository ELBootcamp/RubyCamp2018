class Penguin
  attr_accessor :name, :description, :type
  def initialize(name:, description:)
    @type = "Penguin"
    @name = name
    @description = description
  end

end