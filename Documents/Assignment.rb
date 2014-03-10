#Name: Manel Chada El Islam Benmahcene
#ID: 103334885
#Assignment Delieveries

############### PART 0 ############

######Previous Lab: Part3 Rock Paper Scisor#####

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

###################### PART 1 ###################
class Dessert
    def initialize(name, calories)
        @name = name
	@calories = calories
    #attr_reader :name, :calories # create reader only
    end

#Getters & Setters of the variables
    def name ;	@name ; end
    def name= (new_name) ; @name = new_name ; end
    
    def calories ; @calories ; end
    def calories= (new_calories) ; @calories = new_calories ; end

#Defining the methods
    def healthy?
        if ( calories <200)
	    return true
	else
	    return false
	end
    end

    def delicious?
        return true
    end
end

#TEST
C = Dessert.new("orange", 500)
puts C.healthy?
puts C.delicious?



class JellyBean < Dessert
    def initialize(name, calories, flavor)
	@name = name
	@calories = calories
	@flavor = flavor
    end

	attr_reader  :flavor # create reader (getter) only

    def delicious?
        if ( self.flavor == "black licorice")
	    return false
	else
	    return true
	end
    end
end

#TEST
d = JellyBean.new("sth", 50, "black licorice")
puts d.delicious?




################## PART 2 ##################

class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s       # make sure it's a string
        attr_reader attr_name            # create the attribute's getter
        attr_reader attr_name+"_history" # create bar_history getter

	#Evaluating the return value of the class ( The array of history)
        class_eval %Q"
	def #{attr_name}=(value)
                if !defined? @#{attr_name}_history
                    @#{attr_name}_history = [@#{attr_name}]
                end
                @#{attr_name} = value
                @#{attr_name}_history << value
        end
	"
    end
end

#The class foo with variable bar 
class Foo
    attr_accessor_with_history :bar
end

#TEST
f = Foo.new
f.bar = 1
f.bar = 2
f.bar = 3
puts f.bar_history

##########################PART 3###################

#Defining the new class of errors
class UnsupportedDestinationCurrency < StandardError; end

class Numeric
#A hash table of all money conversions FROM ... TO ..
 #@@currencies =  {'dollar'=>{ 'dollar'=> 1, 'yen'=> 76.92, 'euro'=> 1.292,'rupee'=>52.63}, 'yen'=> {'dollar'=>0.013, 'yen'=>1, 'euro'=>0.01, 'rupee'=>0.684}, 'euro'=>{'dollar'=> 0.77, 'yen'=> 0.01, 'euro'=>1, 'rupee'=>0.01463}, 'rupee'=>{'dollar'=>52.63, 'yen'=> 0.68419, 'euro'=> 67.997,'rupee'=>1}}


#A table of currencies TO Dollar
 @@currencies = {'dollar'=>1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

 def method_missing(method_id, *args, &block)
   singular_currency = method_id.to_s.gsub( /s$/, '') # return copy with filter
   if @@currencies.has_key?(singular_currency)
     self*@@currencies [singular_currency]
   else
     super
   end
 end


 def in(destination_currency)

	#mAKING SURE THE CURRENCY IS A STRING AND COMPATIBLE WITH THE TABLE
	destination_currency = destination_currency.to_s.gsub( /s$/, '')


	#Processing (We divide the rate to
	if @@currencies.key?(destination_currency)
	   result = self / @@currencies[destination_currency].round(3)
	else
	   raise UnsupportedDestinationCurrency
	end
  
   result
  end

end

p "6 Dollars is: "+6.dollar.in(:euro).to_s+"in Euros"
p "8 Euros is equivalent to:"+8.euro.in(:dollar).to_s+"in Dollars"

###########################B) Palidroms ###################

class String


def palindrom
	string =self.downcase.scan(/\w/)
	rev_string = string.reverse
	
	puts rev_string == string
end

end
"racecar".palindrom
"Abracadabra".palindrom
"A man, a plan, a canal --Panama".palindrom 

######################### C) Palindroms Again ##################

class Array

def palindrom? 
	reversed_array = self.reverse
	puts reversed_array == self
end
end

[1,2,3,2,1].palindrom? 
[5,2,7,64,85].palindrom?

######################## PART4 #######################


class CartesianProduct
    include Enumerable
    # Your code here

    def initialize ( seq1, seq2)
	@seq1 = seq1
	@seq2= seq2
    end

    #Defining the getters& setters of the variables
    def seq1; @seq1; end
    def seq1= (new_seq1) ; @seq1 = new_seq1 ; end
    
    def seq2; @seq2; end
    def seq2= (new_seq2) ; @seq2 = new_seq2 ; end

    
    #Iterating through elements of seq1, creating new subarrays with elements of seq2
    def each
     result = {}
      @seq1.each do |elem1|
	 @seq2.each do |elem2|
 		yield [elem1, elem2]
		 end
       end
    end
end

c = CartesianProduct.new([:a,:b, :c], [4,5])
c.each { |elt| puts elt.inspect }


d = CartesianProduct.new([:a,:b], [])
d.each { |elt| puts elt.inspect }


# //////////////////// RECOURCES USED /////////////
#The website of Stackoverflow

#http://stackoverflow.com/questions/9651612/ruby-method-missing
#http://stackoverflow.com/questions/9658724/ruby-metaprogramming-class-eval
# Other searches on google, and Ruby documentation

