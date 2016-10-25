# -------------------------------------------
# -------------------------------------------
#           PCA Regression
# This script computes the pca regression of
# the credit data.
# -------------------------------------------
# -------------------------------------------


set.seed(1)
setwd("~/Desktop/stat159/stat159-fall2016-proj02/data")
credit <- read.csv("Credit.csv")
credit <- credit[,c(2:12)]

library(pls)

# Dummy out categorical data
temp_credit <- model.matrix(Balance ~ ., data = credit)
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)

# Mean centering and standardizing
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

# Train/Test sets
train_indices <- sample(1:400,300)
credit_train <- scaled_credit[train_indices,]
credit_test  <- scaled_credit[-train_indices,]


# Fit Model
pcr.fit=pcr(Balance ~ ., 
             data = data.frame(credit_train),
             scale = FALSE,
             validation = "CV")
summary(pcr.fit)




# Find number of components with best fit
best_mod_comp_pcr <- which.min(pcr.fit$validation$PRESS) # 5
save(best_mod_comp_pcr, "data/pcr_best_model_component.RData")

# Plot

png(file = "images/pcr_validation_plot.png")
validationplot(pcr.fit, val.type = "MSEP", col='skyblue1')
dev.off()
message("File Save Successful: ", "pcr_validation_plot.png")

# Predict on test set using 5 components
pcr.pred = predict(pcr.fit, 
                   credit_test[,-12],
                   ncomp = best_mod_comp_pcr)
# MSE
pcr_mse <- mean((pcr.pred - credit_test[,12])^2)
save(pcr_mse, "data/pcr_mse.RData")

# Refit on full dataset
pcr.fit.full <- pcr(Balance ~ .,
                     data = data.frame(scaled_credit),
                     scale = FALSE, 
                     ncomp = best_mod_comp_pcr)
pcr_sum_full <- summary(pcr.fit.full)
save(pcr_sum_full, file="pcr_full_summary.RData")

message("PCR Script Finished Running")






