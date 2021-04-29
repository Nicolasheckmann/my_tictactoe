class Game
    attr_accessor :player_array, :board, :show

    def initialize
        #cree un nouveau board object
        self.player_array = [] << Player.new("Joueur 1", "X") << Player.new("Joueur 2", "O")
        self.board = Board.new
        self.show = Show.new(board)
    end

    def create_player
        self.player_array.each do |player|
            puts
            puts "#{player.name} comment souhaites tu t'appeller ?"
            print "> "
            player.name = gets.chomp
            puts
            puts "Bienvenu "+"#{player.name}".colorize(:blue)+"! Tu joueras les "+"#{player.x_or_o}".colorize(:blue)
            puts 
        end
    end

    def ask_move(player_index)
        #demande au player suivant de choisir une coordonées
        show.print_which_square
        coordinates = gets.chomp.upcase.to_sym
        #met à jour le hash du board
        #gérer coordinates non valides
        case coordinates
        when /[A-C][1-3]/
            if board.moves_hash[coordinates] == "X" || board.moves_hash[coordinates] == "O"
                puts "Cette case à déjà été jouée, choisis une case vide"
                ask_move(player_index)
            else
                board.moves_hash[coordinates] = player_array[player_index].x_or_o
            end
        else
            puts
            puts "Ceci n'est pas une coordonée valide"
            ask_move(player_index)
        end
    end

    def active_player
        puts
        case board.moves_hash.select{ |key, value| value == "X" || value == "O" }.length 
        when 0, 2, 4, 6, 8
            puts "C'est a "+"#{player_array[0].name}".colorize(:light_red)+" de jouer les "+"#{player_array[0].x_or_o}".colorize(:light_red)
        when 1, 3, 5, 7
            puts "C'est a "+"#{player_array[1].name}".colorize(:light_green)+" de jouer les "+"#{player_array[1].x_or_o}".colorize(:light_green)
        else
            puts "bug?"
        end
    end

    def determinate_winner
        #get un array avec les values du hash ["X", "O", ..., "X"]
        value_array = board.moves_hash.values
        if value_array[0] == value_array[1] && value_array[1] == value_array[2] && value_array[0] != " "
            return 1
        elsif value_array[3] == value_array[4] && value_array[4] == value_array[5] && value_array[3] != " "
            return 1
        elsif value_array[6] == value_array[7] && value_array[7] == value_array[8] && value_array[6] != " "
            return 1
        elsif value_array[0] == value_array[3] && value_array[3] == value_array[6] && value_array[0] != " "
            return 1
        elsif value_array[1] == value_array[4] && value_array[4] == value_array[7] && value_array[1] != " "
            return 1
        elsif value_array[2] == value_array[5] && value_array[5] == value_array[8] && value_array[2] != " "
            return 1
        elsif value_array[0] == value_array[4] && value_array[4] == value_array[8] && value_array[0] != " "
            return 1
        elsif value_array[2] == value_array[4] && value_array[4] == value_array[6] && value_array[2] != " "
            return 1
        end
    end

    def play_turn
        until determinate_winner || board.is_full?
            active_player
            ask_move(0)
            show.print_board
            if determinate_winner || board.is_full?
                break
            end
            active_player
            ask_move(1)
            show.print_board
            if determinate_winner || board.is_full?
                break
            end
        end
    end

    def game_results
        if determinate_winner
            case board.moves_hash.select{ |key, value| value == "X" || value == "O" }.length
            when 5, 7, 9
                puts
                puts "#{player_array[0].name}".colorize(:light_red)+" a gagné! Bien joué!"
            when 6, 8
                puts
                puts "#{player_array[1].name}".colorize(:light_green)+" a gagné! Bien joué!"
            else
                puts "bug case statement?"
            end
        elsif !determinate_winner && board.is_full?
            puts
            puts "Match nul! Personne ne gagne, personne ne perd..."
        else
            puts "bug?"
        end
    end
end