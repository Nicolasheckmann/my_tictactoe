class Show
    attr_accessor :board

    def initialize(board)
        self.board = board
    end

    def welcome
        puts
        puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".colorize(:yellow)
        puts "|".colorize(:yellow)+"Bienvenue dans          **"+"Le jeu du MORPION".colorize(:blue)+"**                "+"|".colorize(:yellow)
        puts "|".colorize(:yellow)+"But du jeu : Etre le premier a faire une ligne de 3 symboles "+"|".colorize(:yellow)
        puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++".colorize(:yellow)
    end

    def print_board
        system "clear" 
        puts "     A   B   C"
        puts "   _____________"
        print " 1 | #{board.moves_hash[:A1]} "; print "| #{board.moves_hash[:B1]} "; puts "| #{board.moves_hash[:C1]} |"
        puts "   _____________"
        print " 2 | #{board.moves_hash[:A2]} "; print "| #{board.moves_hash[:B2]} "; puts "| #{board.moves_hash[:C2]} |"
        puts "   _____________"
        print " 3 | #{board.moves_hash[:A3]} "; print "| #{board.moves_hash[:B3]} "; puts "| #{board.moves_hash[:C3]} |"
        puts "   _____________"
    end

    def print_which_square
        puts
        puts "Quelle case veux-tu jouer ? Entre une coordonée au format suivant :"
        puts "Une lettre a, b ou c, suivie d'un chiffre de 1 à 3, comme a1 ou c3 par exemple"
        puts
        print "> "
    end

    def continue?
        puts
        puts "------->  Entrée pour continuer  <---------".colorize(:light_black)
        gets
        puts
    end
    def ending
        system "clear"
        puts
        puts "Merci d'avoir joué!"
        puts
        puts "------====### THE END ###====------"
        puts
    end
end