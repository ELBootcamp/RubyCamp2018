class Lemur
    attr_accessor :name, :description, :kind, :type
    def initialize(name:, kind:,  description:)
        @type = "Lemur"
        @name = name
        @kind = kind
        @description = description
    end

end