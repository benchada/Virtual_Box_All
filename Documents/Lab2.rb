#Name: Manel Chada El Islam Benmahcene
#ID: 103334885
#LAB 2 Delieveries

# Part1: Hello World



class HelloWorldClass
	def initialize (name)
	   @name = name.capitalize
	end
	def sayHi
	    puts "Hello #{@name}!"
	end
end

hello = HelloWorldClass.new ("{chada}")
hello.sayHi

##########################################

# Part2: Strings
# a)Palindroms:

def palindrom? (string)
	string = string.downcase.scan(/\w/)
	rev_string = string.reverse
	
	puts rev_string == string
end



palindrom? ("racecar")
palindrom? ("Abracadabra")
palindrom? ("A man, a plan, a canal --Panama")

#################################################
# Part2 - Strings

# b) Word Count

def count_words(string)
  h = Hash.new
  words = string.downcase.scan(/\w+/)
  words.each do |word|
    if h.has_key?(word)
      h[word] = h[word]+1
    else
      h[word] = 1
    end
  end
  

  #sorting the hash by value & printing it
  h = h.sort_by { |x,y| y}
  h.each do  |word,count|
  puts " #{word} => #{count}"
  end
  
end

count_words("A man, a plan, a canal -Panama")
count_words("Doo bee doo bee doo")

#############################################

#Part4
def combine_anagrams(words)
   anagrams ={}
     words.each do |word|
       anagrams[word.downcase.split('').sort.join] ||=[]
       anagrams[word.downcase.split('').sort.join] << word #for each word 
     end
     p anagrams.values
end

combine_anagrams(['cars', 'for', 'potatoes', 'four', 'racs', 'creams', 'scream']);

