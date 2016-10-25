# -------------------------------------------
# -------------------------------------------
#           PLS Regression
# This script computes the pls regression of
# the credit data.
# -------------------------------------------
# -------------------------------------------


library(pls)

source("code/scripts/data-preprocess.R")

# -------------------------------------------
# Fit Model
# -------------------------------------------
pls.fit=plsr(Balance ~ ., 
             data = data.frame(credit_train),
             scale = FALSE,
             validation = "CV")
summary(pls.fit)

# -------------------------------------------
# Find number of components with best fit
# -------------------------------------------
best_mod_comp <- which.min(pls.fit$validation$PRESS) # 5
save(best_mod_comp, "data/pls_best_model_component.RData")

# -------------------------------------------
# Plot
# -------------------------------------------
png(file = "images/pls_validation_plot.png")
validationplot(pls.fit, val.type = "MSEP", col='skyblue1')
dev.off()
message("File Save Successful: ", "pls_validation_plot.png")

# -------------------------------------------
# Predict on test set using 5 components
# -------------------------------------------
pls.pred = predict(pls.fit, 
                   credit_test[,-12],
                   ncomp = best_mod_comp)

# -------------------------------------------
# MSE
# -------------------------------------------
pls_mse <- mean((pls.pred - credit_test[,12])^2)
save(pls_mse, "data/pls_mse.RData")

# -------------------------------------------
# Refit on full dataset
# -------------------------------------------
pls.fit.full <- plsr(Balance ~ .,
                     data = data.frame(scaled_credit),
                     scale = FALSE, 
                     ncomp = 5)
pls_sum_full <- summary(pls.fit.full)
save(pls_sum_full, file="pls_full_summary.RData")

message("PLS Script Finished Running")
# end 


