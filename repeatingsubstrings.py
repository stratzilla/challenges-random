def onlySubstrings(stringOrig):
	stringCopy = (stringOrig+'.')[:-1] # copy string contents
	for i in range(1, len(stringCopy)): # for each character
		stringCopy = stringCopy[1:]+stringCopy[0] # shift first char to end
		if stringCopy == stringOrig # if equivalent to original input 
			return True # it consists of substrings only
	else: # otherwise the only substring is the string itself
		return False

if __name__ == '__main__':
    wordList = ['testtest','testteste','test','tetestst']
    print('The below words only contain substrings:')
    for word in wordList:
        print(onlySubstrings(word), '\t', word)