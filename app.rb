require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/board_square'
require_relative 'lib/show'

class Application
 attr_accessor :my_game, :one_more

    def initialize
        self.my_game = Game.new
        self.one_more = true
    end

    def player_intro
        my_game.create_player
        my_game.show.continue?
    end

    def play_game
        my_game.show.welcome
        my_game.show.continue?
        player_intro
        my_game.show.print_board
        my_game.play_turn
        my_game.game_results
        one_more_game?
        self.my_game = Game.new
    end

    def one_more_game?
        puts
        puts "Voulez vous jouer une autre partie ? (y/n)"
        answer = gets.chomp
        if answer == "y"
            one_more
        elsif answer == "n"
            self.one_more = false
        else
            puts
            puts "Il faut taper y ou n pour répondre"
            one_more_game?
        end
    end

    def play
        while one_more
            play_game
        end
        my_game.show.ending
    end
end

my_app = Application.new
my_app.play


binding.pry