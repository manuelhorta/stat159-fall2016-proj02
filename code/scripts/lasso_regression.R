# -------------------------------------------
# -------------------------------------------
#           Lasso Regression
# This script computes the lasso regression of
# the credit data.
# -------------------------------------------
# -------------------------------------------

message("Running lasso script")
library(glmnet)

source("code/scripts/data-preprocess.R")

# -------------------------------------------
# Fit Model
# -------------------------------------------
grid = 10^seq(10, -2, length = 100)

x <- model.matrix(Balance ~ ., data = data.frame(credit_train))
y <- data.frame(credit_train)$Balance

lasso_mod <- cv.glmnet(x, y, intercept=FALSE, standardize=FALSE, lambda = grid, alpha=1)
summary(lasso_mod)


lasso_best_mod <- lasso_mod$lambda.min


# -------------------------------------------
# Plot
# -------------------------------------------
png(file = "images/lasso_validation_plot.png")
plot(lasso_mod)
title('Plot of Lasso Model', line = 2)
dev.off()
message("File Save Successful: ", "lasso_validation_plot.png")

# -------------------------------------------
# Preditct and MSE
# -------------------------------------------
lasso_pred <- predict(lasso_mod, s = lasso_best_mod, newx= model.matrix(Balance ~ ., data = data.frame(credit_test)))
lasso_mse <- mean((lasso_pred - credit_test[,12])^2)

# -------------------------------------------
# Refit on full dataset
# -------------------------------------------
lasso_fit_full <- cv.glmnet(model.matrix(Balance ~ .,data = data.frame(scaled_credit)),
                            data.frame(scaled_credit)$Balance,
                            intercept = FALSE,
                            standardize = FALSE)


(lasso_pred_full <- predict (lasso_fit_full, type="coefficients", s = lasso_best_mod))


save(lasso_mod, lasso_best_mod, lasso_mse, lasso_fit_full, lasso_pred_full, file = 'data/lasso-saved-objects.Rdata')

sink('data/lasso-results.txt')
'> lasso best lambda'
lasso_best_mod
'> lasso test MSE'
lasso_mse
'> lasso official coefficients'
lasso_pred_full
sink(NULL)
