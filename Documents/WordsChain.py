import re

f =open('list of words py.txt')
words =f.readlines()
f.close()

def get_chain(word,Alist,chain):

	sorted_word ="".join(sorted(word)) #Sorting the letters within one word
	 #Initializing the list of chained words

	#Itterating through the elements of the array
	for x in Alist:
		sorted_x ="".join(sorted(x))  # Sorting the letters of the words
		#print(sorted_x)
		if (re.match(sorted_word,sorted_x)):
			print ("TRUE..STH FOUND YAAY!")
			if (len(sorted_x)==len(word)+1):
				print x
				chain.append(x)
				return get_chain(x,Alist,chain)
	


rtrn_list =[]
kalima ="ABLE"

get_chain(kalima,words,rtrn_list)

print (rtrn_list)
