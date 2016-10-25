# -------------------------------------------
# -------------------------------------------
#           PCA Regression
# This script computes the pca regression of
# the credit data.
# -------------------------------------------
# -------------------------------------------

message("Running pca script")
library(pls)

source("code/scripts/data-preprocess.R")

# -------------------------------------------
# Fit Model
# -------------------------------------------
pcr.fit=pcr(Balance ~ ., 
             data = data.frame(credit_train),
             scale = FALSE,
             validation = "CV")
summary(pcr.fit)



# -------------------------------------------
# Find number of components with best fit
# -------------------------------------------
best_mod_comp_pcr <- which.min(pcr.fit$validation$PRESS) # 10
save(best_mod_comp_pcr, file = "data/pcr_best_model_component.RData")

# -------------------------------------------
# Plot
# -------------------------------------------
png(file = "images/pcr_validation_plot.png")
validationplot(pcr.fit, val.type = "MSEP", col='skyblue1')
dev.off()
message("File Save Successful: ", "pcr_validation_plot.png")

# -------------------------------------------
# Predict on test set using 5 components
# -------------------------------------------
pcr.pred = predict(pcr.fit, 
                   credit_test[,-12],
                   ncomp = best_mod_comp_pcr)

# -------------------------------------------
# MSE
# -------------------------------------------
pcr_mse <- mean((pcr.pred - credit_test[,12])^2)
save(pcr_mse, file = "data/pcr_mse.RData")

# -------------------------------------------
# Refit on full dataset
# -------------------------------------------
pcr.fit.full <- pcr(Balance ~ .,
                     data = data.frame(scaled_credit),
                     scale = FALSE, 
                     ncomp = best_mod_comp_pcr)
pcr_sum_full <- summary(pcr.fit.full)
save(pcr_sum_full, file = "pcr_full_summary.RData")

message("PCR Script Finished Running")






