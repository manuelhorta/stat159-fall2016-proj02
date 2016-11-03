# -------------------------------------------
# -------------------------------------------
#           OLS Regression
# This script computes the OLS regression of
# the credit data.
# -------------------------------------------
# -------------------------------------------

message("Running OLS script")
source("code/scripts/data-preprocess.R")

# -------------------------------------------
# Fit Model
# -------------------------------------------

ols<-lm(Balance~Income+Limit+Rating+Cards+Age+Education
        +GenderFemale+StudentYes+MarriedYes+EthnicityAsian
        +EthnicityCaucasian, 
        data=as.data.frame(scaled_credit))

summary_ols <- summary(ols)
mse_ols <- mean(ols$residuals^2)

sink(file = "data/model-results/ols-results.txt")
summary_ols
mse_ols
sink()

save(ols, summary_ols, mse_ols, 
     file ='data/ols-saved-objects.Rdata')

# -------------------------------------------
# Plot
# -------------------------------------------

png(file = "images/ols_plots.png")
par(mfrow=c(2,2))
plot(ols)
dev.off()

message("OLS Script Finished Running")

