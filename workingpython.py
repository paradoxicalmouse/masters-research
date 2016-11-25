#!//anaconda/bin/python

import csv
import nltk
from nltk.tokenize import TweetTokenizer
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer

ps = PorterStemmer()
stop_words = set(stopwords.words('english'))
tknzr = TweetTokenizer()
filename = '/Users/tbmorris/Documents/Current Working Assets/stacksample/Questions.csv'
stopindex = 20

with open(filename,'rt') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    i = 0
    for row in reader:
        if  i < stopindex:
            i += 1
            tokens =  tknzr.tokenize(row[6])
            tokens = [w for w in tokens if not w in stop_words]
            tokens = [ps.stem(w) for w in tokens]
            print(tokens)
        else:
            break 
