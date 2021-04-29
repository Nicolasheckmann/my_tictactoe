class Player
    attr_accessor :name, :x_or_o

    def initialize(name, x_or_o)
        self.name = name
        self.x_or_o = x_or_o
    end
end