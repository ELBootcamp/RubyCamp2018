class Otter
    attr_accessor :name, :description, :type
    def initialize(name:, description:)
        @type = "Otter"
        @name = name
        @description = description
    end

end