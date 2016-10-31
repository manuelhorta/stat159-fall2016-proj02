# -------------------------------------------
# -------------------------------------------
#           Data Preprocessing
# This script performs the following on the credit data:
# 
#   - 1)   Load in credit data
#   - 2)   'Dummify' the categorical variables
#   - 3)   Mean center and standardize variables
#   - 4)   Split data into train/test sets
#
# 
# -------------------------------------------
# -------------------------------------------



set.seed(1)

# -------------------------------------------
# 1) Load in credit data
# -------------------------------------------
#setwd("c:/users/manue/Desktop/stat159/stat159-fall2016-proj02")
credit <- read.csv("data/Credit.csv")
credit <- credit[,c(2:12)]

# -------------------------------------------
# 2) Dummify categorical variables
# -------------------------------------------
temp_credit <- model.matrix(Balance ~ ., data = credit)
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)

# -------------------------------------------
# 3) Mean centering and standardizing
# -------------------------------------------
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)
write.csv(scaled_credit, file = "data/scaled-credit.csv")

# -------------------------------------------
# 4) Train/Test sets
# -------------------------------------------
set.seed(1)

train_indices <- sample(1:400,300)
test_indices <- which(!(c(1:400) %in% train_indices))

# Save and load vectors
save(train_indices, test_indices, file = 'data/train-test-indices.Rdata')

local({
  load("data/train-test-indices.RData")
  ls()
})
#

credit_train <- scaled_credit[train_indices,]
credit_test  <- scaled_credit[-train_indices,]

message("Data Preprocessing Complete")
# Now, to access the data, just call source("code/scripts/data-preprocess.R")
