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
meta(questionsCorp, tag = "Id")<-questions$Id
meta(questionsCorp, tag = "OwnerUserId")<-questions$OwnerUserId
meta(questionsCorp, tag = "CreationDate")<-questions$CreationDate
meta(questionsCorp, tag = "ClosedDate")<-questions$ClosedDate
meta(questionsCorp, tag = "Score")<-questions$Score
meta(questionsCorp, tag = "Title")<-questions$Title

questionsDTM <- DocumentTermMatrix(questionsCorp)
