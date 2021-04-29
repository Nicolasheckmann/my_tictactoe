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
         my_game.show.continue?
         system "clear"
         player_intro               # demande leurs noms aux joueurs
         my_game.show.print_board   # affiche le board
         my_game.play_turn          # lance les tours jusqu'a un gagnant ou match nul
         my_game.game_results       # annonce les résultats de la partie
         one_more_game?             # propose de rejouer ou arreter       
         self.my_game = Game.new    # crée un nouvel objet jeu pour la partie suivante
     end
 
     def one_more_game?             # retourne true si on répond y, false si n
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
        my_game.show.welcome
        while one_more                #répéte play_game tant que one_more_game retourne vrai
            play_game
        end
        my_game.show.ending           #si one_more_game = false on sort de la boucle while et montre l'ending
     end
 end