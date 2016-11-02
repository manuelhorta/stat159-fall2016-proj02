# -------------------------------------------
# -------------------------------------------
#           PLS Regression
# This script computes the pls regression of
# the credit data.
# -------------------------------------------
# -------------------------------------------

message("Begin PLS Script")
library(pls)
set.seed(1)
source("code/scripts/data-preprocess.R")

# -------------------------------------------
# Fit Model
# -------------------------------------------
pls_fit=plsr(Balance ~ ., 
             data = data.frame(credit_train),
             scale = FALSE,
             validation = "CV")
summary(pls_fit)

# -------------------------------------------
# Find number of components with best fit
# -------------------------------------------
best_mod_comp_pls <- which.min(pls_fit$validation$PRESS) # 5
#save(best_mod_comp, file = "data/pls_best_model_component.RData")

# -------------------------------------------
# Plot
# -------------------------------------------
png(file = "images/pls_validation_plot.png")
validationplot(pls_fit, val.type = "MSEP", col='skyblue1')
dev.off()
message("File Save Successful: ", "pls_validation_plot.png")

# -------------------------------------------
# Predict and MSE
# -------------------------------------------
pls_pred = predict(pls_fit, 
                   credit_test[,-12],
                   ncomp = best_mod_comp_pls)


pls_mse <- mean((pls_pred - credit_test[,12])^2)
#save(pls_mse, file = "data/pls_mse.RData")

# -------------------------------------------
# Refit on full dataset
# -------------------------------------------
pls_fit_full <- plsr(Balance ~ .,
                     data = data.frame(scaled_credit),
                     scale = FALSE, 
                     ncomp = 5)

pls_full_coefs <- coefficients(pls_fit_full)
#save(pls_sum_full, file="pls_full_summary.RData")

save(pls_fit, best_mod_comp_pls, pls_pred, pls_mse, pls_full_coefs, 
     file ='data/pls-saved-objects.Rdata')


sink('data/model-results/pls-results.txt')
'> best_mod_comp_pls' 
best_mod_comp_pls
'> pls test MSE'
pls_mse
'> pls official coefficients'
pls_full_coefs
sink(NULL)


message("PLS Script Finished Running")
# end
