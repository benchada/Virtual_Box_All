######Part3 Rock Paper Scisor#####

#Declaration of errors
class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end



def rps_game_winner (players)

    #Validating the input
    raise NoSuchStrategyError unless players[0][1]=~ /[rspRSP]/ or players[1][1] =~ /[rspRSP]/
   
    #When player1 is the winner
    winning_combinations = ["rs", "sp", "pr", "rr", "ss", "pp"]

    return winning_combinations.index(players[0][1].downcase+players[1][1].downcase)? players[0] : players[1]

end



# Defining the method of tournament recursion

def tournament (game)
     #Valdation of input
     raise WrongNumberOfPlayersError unless game.length == 2

     #Base Case: No more arrays, we get the winner
     if game[0][0].is_a? String
       return rps_game_winner(game)
     else
        #Recursion on the two parts of the array
	return rps_game_winner([tournament(game[0]),tournament(game[1])])
     end
end




#TESTING
	game_list = [[ "Armando", "P" ], [ "Dave", "S" ]]

	puts game_list.to_s + " => " + rps_game_winner(game_list).to_s
	

puts

tournament_list = [
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"], ["Michael", "S"] ],
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]
puts tournament_list.to_s + " => " + tournament(tournament_list).to_s

gets

