class Board
    attr_accessor :moves_hash

    def initialize
        self.moves_hash = {A1: " ", B1: " ", C1: " ",A2:  " ", B2: " ", C2: " ", A3: " ", B3: " ", C3: " "}
    end

    def is_full?
        moves_hash.select{ |key, value| value == "X" || value == "O" }.length == 9 ? true : false
    end
end