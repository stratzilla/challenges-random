'''
Determine if a string contains strictly
a repetition of any substrings

for example, "abcabc" is comprised of two
equal substrings "abc", likewise "defdefdef" is
three "def". "abcdabc" has no single repeating
substring so it does not qualify

this implementation suggests
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

execute like so:
$ python repeatingsubstrings.py
'''

def contains_substring_repetitions(str):
	# test whether shifted string equals
	for i in range(1, len(str)):
		if shift_string(str, i) == str: # if equivalent to original input 
			return True
		elif i == int(len(str)) + 1: # can only contain substrings at most len length
			return False
	return False

def shift_string(str, n):
	# shift first char to end
	return str[n:] + str[:n]

if __name__ == '__main__':
    	word_list = ['testtest','testteste','test','tetestst'] # some test words
    	print('The below words only contain substring repetitions:')
    	for word in word_list: # for each word
		print(contains_substring_repetitions(word), '\t', word)
	
'''
True	testtest
False	testteste
False	test
False	tetestst
'''
