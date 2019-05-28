import sys

'''
$ python3 cipher.py <arg>
<arg> is a string you wish to cipher
'''

def cipher(n):
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    code = {}
    counter = 1
    for i in alphabet:
        code[counter] = i
        counter += 1
    check = True
    for i in code:
        if n in code[i]:
            if n == 'z':
                return 'a'
            else:
                return code[i + 1]
    return n

def scramble(n):
    sentence = ''
    for i in n:
        if i == i.upper():
            x = cipher(i.lower())
            sentence += x.upper()
        else:
            sentence += cipher(i)
    return sentence

if __name__ == '__main__':
    print(scramble(sys.argv[1]))
