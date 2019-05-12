'''
Determine if a string contains strictly
a repetition of any substrings

a string contains only substring repetitions
if you can shift it and get the same string
in under len shifts

for example:
testtest - 0 shifts, original string
esttestt - 1 shift, not original
sttestte - 2 shifts, not original
ttesttes - 3 shifts, not original
testtest - 4 shifts, original again

since 4 < len, the string only contains substring
repetitions. But consider "testteste"; this will
only become the original after len shifts, meaning
it does not contain strictly substring repetitions
'''

def shiftString(str, n):
	# shift first char to end
	return str[n:] + str[:n]

def onlySubstrings(str):
	# test whether shifted string equals
	for i in range(1, len(str)):
		if shiftString(str, i) == str: # if equivalent to original input 
			return True # it consists of substrings only
	return False # otherwise the only substring is the string itself

if __name__ == '__main__':
    	wordList = ['testtest','testteste','test','tetestst'] # some test words
    	print('The below words only contain substring repetitions:')
    	for word in wordList: # for each word
		print(onlySubstrings(word), '\t', word)
	
'''
True	testtest
False	testteste
False	test
False	tetestst
'''
