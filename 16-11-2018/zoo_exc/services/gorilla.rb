class Gorilla
    attr_accessor :name, :description, :type, :origin
    def initialize(name:, origin:, description:)
        @type = "Gorilla"
        @name = name
        @origin = origin
        @description = description
    end

end