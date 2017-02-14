questions <- read.table("../Questions.csv",
                        sep=',',
                        header=T,
                        na.strings="NA",
                        comment.char="",
                        allowEscapes = F,
                        quote='"',
                        nrows=10)
require(tm)
questionsCorp <- Corpus(VectorSource(questions$Body))
questionsCorp <- tm_map(questionsCorp, stripWhitespace)
questionsCorp <- tm_map(questionsCorp, content_transformer(tolower))
questionsCorp <- tm_map(questionsCorp, removeWords, stopwords("english"))
#tm_map(questionsCorp, stemDocument)
questionsDTM <- DocumentTermMatrix(questionsCorp)
questionsFrame <- data.frame(as.matrix(questionsDTM))
#http://stackoverflow.com/questions/21163207/document-term-matrix-for-naive-bayes-classfier-unexpected-results-r
#may help from here.