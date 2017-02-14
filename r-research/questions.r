questions <- read.table("../Questions.csv",
                        sep=',',
                        header=T,
                        na.strings="NA",
                        comment.char="",
                        allowEscapes = F,
                        quote='"',
                        nrows=20)
require(tm)
require(SnowballC)
questionsCorp <- Corpus(VectorSource(questions$Body))
titlesCorp <- Corpus(VectorSource(questions$Title))
#ftp://cran.r-project.org/pub/R/web/packages/tm/vignettes/tm.pdf
#questionsCorp <- tm_map(questionsCorp, stripWhitespace)
questionsCorp <- tm_map(questionsCorp, content_transformer(tolower))
questionsCorp <- tm_map(questionsCorp, removeWords, stopwords("english"))
questionsCorp <- tm_map(questionsCorp, removePunctuation)
questionsCorp <- tm_map(questionsCorp, stemDocument)
questionsDTM <- DocumentTermMatrix(questionsCorp, control=list(removePunctuation=TRUE))
#questionsDTM <- inspect(removeSparseTerms(questionsDTM, 0.9))
questionsFrame <- data.frame(as.matrix(questionsDTM))
names(questionsFrame)
#http://stackoverflow.com/questions/21163207/document-term-matrix-for-naive-bayes-classfier-unexpected-results-r
#may help from here.