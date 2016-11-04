# -------------------------------------------
# -------------------------------------------
#           PCA Regression
# This script computes the pca regression of
# the credit data.
# -------------------------------------------
# -------------------------------------------


message("Running pca script")
library(pls)
set.seed(1)
source("code/scripts/data-preprocess.R")

# ------------------------------------------
# Fit Model
# -------------------------------------------
pcr_fit=pcr(Balance ~ ., 
             data = data.frame(credit_train),
             scale = FALSE,
             validation = "CV")
summary(pcr_fit)



# -------------------------------------------
# Find number of components with best fit
# -------------------------------------------
best_mod_comp_pcr <- which.min(pcr_fit$validation$PRESS) # 10
#save(best_mod_comp_pcr, file = "data/pcr_best_model_component.RData")

# -------------------------------------------
# Plot
# -------------------------------------------
png(file = "images/pcr_validation_plot.png")
validationplot(pcr_fit, val.type = "MSEP", col='skyblue1')
dev.off()
message("File Save Successful: ", "pcr_validation_plot.png")

# -------------------------------------------
# Predict and MSE
# -------------------------------------------
pcr_pred = predict(pcr_fit, 
                   credit_test[,-12],
                   ncomp = best_mod_comp_pcr)

pcr_mse <- mean((pcr_pred - credit_test[,12])^2)
#save(pcr_mse, file = "data/pcr_mse.RData")

# -------------------------------------------
# Refit on full dataset & get coefficients
# -------------------------------------------
pcr_fit_full <- pcr(Balance ~ .,
                     data = data.frame(scaled_credit),
                     scale = FALSE, 
                     ncomp = best_mod_comp_pcr)

#save(pcr_sum_full, file = "pcr_full_summary.RData")
pcr_full_coefs <- coefficients(pcr_fit_full)

message("PCR Script Finished Running")


save(pcr_fit, best_mod_comp_pcr, pcr_pred, pcr_mse, pcr_full_coefs, 
     file ='data/pcr-saved-objects.Rdata')


sink('data/model-results/pcr-results.txt')
'> best_mod_comp_pcr' 
best_mod_comp_pcr
'> pcr test MSE'
pcr_mse
'> pcr official coefficients'
pcr_full_coefs
sink(NULL)


