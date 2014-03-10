import re
from operator import itemgetter
str = 'an example word:cat!!'

match = re.search(r'word:\w\w\w', str)

# If-statement after search() tests if it succeeded
if match:                      
    print 'found', match.group() ## 'found word:cat'
else:
    print 'did not find'



##### ====== ##### ======= ##### ===== #####

f = open ('list of words py.txt')
words = f.readlines()
f.close()



#Sorting each word in the list according to its
word_2version =[]

for x in words:
	sorted_x ="".join(sorted(x))
	mytuple =(x, sorted_x)
	#print (mytuple)
	word_2version.append(mytuple)


# Sorting the whole list of WORDS now
words_sorted = sorted (word_2version,key=itemgetter(1))
#print words_sorted


#Creating word groups according to their length
group = []
new =[]

for i in range(16):
	group.append(new)

for word_tuple in words_sorted:
	group[len(word_tuple[1])-1].append(word_tuple)


print len(group[1])





e = open("sorted_words.txt","w",1)
e.write(words_sorted)
e.close()



#for x in words:
#	x = "".join(sorted(x))
#	for y in words:
#		y ="".join(sorted(x))
#		match = re.search(r., y)
		






