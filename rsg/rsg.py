# Generate random sentences
import random as rd

dict = 'dict/'
wTypes = ['adjectives', 'adverbs', 'nouns', 'verbs']
sCount = ['1syllable', '2syllable', '3syllable', '4syllable']
punctuation = [['.', '?', '!'], [',', ';', '---'], ['(', ')', '\'', '\"']]

# Define syntax for sentences.
syntax = [wTypes[2], wTypes[3], wTypes[2]]

def main():
    words = []
    for i in range( len(syntax) ): # Create a list of words
        filepath = 'rsg' + '/' + dict + syntax[i] + '/' + syntax[i] + '.txt'
        with open(filepath, 'r') as fp: # Open the dictionary
            l = fp.readlines()
            words.append( rd.choice(l).strip() )
            fp.close()

    y = rd.randrange(0, len(punctuation[0]))
    sentence = ' '.join(map(str, words)) + punctuation[0][y]
        
    return print(sentence)

main()