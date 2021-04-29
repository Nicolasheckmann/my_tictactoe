class BoardSquare
    attr_accessor :x_or_o, :coordinates

    def initialize(x_or_o, coordinates)
        self.x_or_o = x_or_o
        self.coordinates = coordinates
    end
end