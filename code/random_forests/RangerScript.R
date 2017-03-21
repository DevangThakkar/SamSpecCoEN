# import the library ranger
library("ranger")

# import names of all files
trainfile <- commandArgs(trailingOnly=TRUE)[1]
# print(trainfile)
testfile <- commandArgs(trailingOnly=TRUE)[2]
# print(testfile)
impoutfile <- commandArgs(trailingOnly=TRUE)[3]
# print(impoutfile)
predoutfile <- commandArgs(trailingOnly=TRUE)[4]
# print(predoutfile)

#read test and train files
train <- read.csv(trainfile, header=FALSE)
test <- read.csv(testfile, header=FALSE)
print("datasets read into R")

#create random forest with default parameters
rf <- ranger(formula = V22179 ~ ., data = train, importance = "permutation")
print("tree created")

#print importance and pvalues to output file provided in impoutfile 
out <- capture.output(importance_pvalues(rf, formula = V22179 ~ ., data = train, importance = "permutation", write.forest = TRUE, classification = TRUE))
cat("Permutation importance", out, file = impoutfile, sep = "\n", append = TRUE)
print("importance_pvalues calculated")

#print predictions to outputfile provided in predoutfile
out1 <- predict(rf, test)$predict
cat("Predictions", out1, file = predoutfile, sep = "\n", append = TRUE)
print("predictions calculated")
