#!//anaconda/bin/python

##################################################
# Data Cleaning Python Script                    #
# Taylor Morris                                  #
# Last Modified: 01-09-2017                      #
# Modification Notes: Added comments             #
##################################################

# import statements
import csv
import nltk
from nltk.tokenize import TweetTokenizer
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer

# create stemmer object
ps = PorterStemmer()

# set stop words to english default
stop_words = set(stopwords.words('english'))

# create tokenizer object. Here, tweet tokenizer is used, as tweets are
# similar in overall formal (html) to stack overflow postings.
tknzr = TweetTokenizer()

# create filename string - just want to try and keep the code looking
# clean 
filename = '/Users/tbmorris/Documents/Current Working Assets/stacksample/Questions.csv'

# for testing purposes, we don't want to run over all of the data - that
# would take much too long.
stopindex = 20


with open(filename,'rt') as csvfile: # open file
    reader = csv.reader(csvfile, delimiter=',') # create file reader
    i = 0 # create a counter to keep track of how many entries we've done
    for row in reader: # for each entry in the data
        if  i < stopindex: 
            i += 1 
    
            # tokenize the entry's question text (description)
            tokens =  tknzr.tokenize(row[6])

            # remove stop words
            tokens = [w for w in tokens if not w in stop_words] 
            
            # take tokens down to their stems
            tokens = [ps.stem(w) for w in tokens]

            # print the tokens for verification that it worked.
            print(tokens)
        else: # stop once we hit stopindex entries
            break 